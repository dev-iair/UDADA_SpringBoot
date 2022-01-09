package ga.udada.udada.exercise;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/exercise")
public class ExerciseController {

	private final ExerciseService exerciseService;
	
	@GetMapping("/list")
	public void getList(Model model, ExercisePageRequestDTO exercisePageRequestDTO, Authentication auth) throws Exception  {
		
		List<ExerciseDTO> list = exerciseService.getListWithImageAndPagingAndSearch(exercisePageRequestDTO);
		model.addAttribute("list", list);
		// int total = recipeService.countAll();
		int total = exerciseService.countAllWithSearch(exercisePageRequestDTO);
		model.addAttribute("exercisePageResultDTO", new ExercisePageResultDTO(exercisePageRequestDTO, total));
	}//getList end
	
	@GetMapping("/read")
	public void get(Long eNo, Model model){
		model.addAttribute("dto", exerciseService.get(eNo));
	}//read end
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/mylist")
	public void mylist(Authentication auth, Model model, ExercisePageRequestDTO exercisePageRequestDTO) {
		exercisePageRequestDTO.setLoginUser(auth.getName());
		List<Exercise_myDTO> mylist = exerciseService.myList(exercisePageRequestDTO);		
		int total = exerciseService.countAllMylist(exercisePageRequestDTO);		

		model.addAttribute("exercisePageResultDTO", new ExercisePageResultDTO(exercisePageRequestDTO, total));
		model.addAttribute("mylist", mylist);
	}//mylist end
	
	@GetMapping("/myread")
	public String myget(Long eNo, Long emNo, Model model){
		
		model.addAttribute("emNo", emNo);
		model.addAttribute("dto", exerciseService.get(eNo));
	
		return "exercise/myread";
		
	}//read end
	
	@PostMapping("/remove")
	public String remove(Long emNo, RedirectAttributes rttr) throws Exception{

		exerciseService.remove(emNo);
		rttr.addFlashAttribute("msg","운동목록이 삭제되었습니다. ");
		
		return "redirect:/exercise/mylist";
	}
	
	@PostMapping("/insert")
	public String insert(Authentication auth, Exercise_myDTO exercise_myDTO) {
					
		exerciseService.insert(exercise_myDTO);
		
		return "redirect:/exercise/mylist/";
		
	}
	
	@ResponseBody
	@PostMapping("/getMyExcsList")
	public List<ExerciseGetMyListDTO> getMyExcsList(String mEmail) {
		
		List<ExerciseGetMyListDTO> excsList = exerciseService.getMyExcsList(mEmail);
		for(int i=0; i<excsList.size(); i++) {
			String title = excsList.get(i).getKcal()+"kcal";
			excsList.get(i).setTitle(title);
		}

		return excsList;
	}
	
}//class end
