package ga.udada.udada.recipe;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequiredArgsConstructor
public class RecipeGradeController {

	private final RecipeGradeService recipeGradeService;


	@GetMapping("/recipe/grade/{rNo}") 
	public ResponseEntity<Double> loadAvgByRNo(@PathVariable("rNo")Long rNo) throws Exception{
	   Double avg = recipeGradeService.loadAvgByRNo(rNo);
	   if(avg==null)  avg=0.00;
	   
	   return new ResponseEntity<>(avg , HttpStatus.OK);
	  }
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/recipe/grade", consumes="application/json" , produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody Map<String, String> params) throws Exception {
		
		log.info(params.toString());
		Long rNo = Long.parseLong(params.get("rNo"));
		String mEmail = params.get("mEmail");
		int rgGrade = Integer.parseInt(params.get("rgGrade"));
		
		RecipeGradeDTO recipeGradeDTO = RecipeGradeDTO.builder()
		  .rNo(rNo).mEmail(mEmail).rgGrade(rgGrade).build();
		 
		log.info(recipeGradeDTO.toString()); 
		recipeGradeService.register(recipeGradeDTO);
		return new ResponseEntity<>("success",HttpStatus.OK);
	}
	 

}
