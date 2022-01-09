package ga.udada.udada.foodmy;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FoodMyController {
	
	private final FoodMyService foodMyService;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/member/foodMy")
	public String getList(Authentication auth, Model model ,@RequestParam(required = false) String day 
			,RedirectAttributes rttr) throws Exception{
		
		String today = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date newDate = new Date();
		String compareDay = sdf.format(newDate);
		
		//미래의 날짜 or 비정상적인 날짜 (ex) 2021-06-31 , 20210630 
		if((day!=null && day.compareTo(compareDay)>0) || (day!=null && (!isValidDate(day)))){
			return "redirect:/member/foodMy";
		}
		//과거의 유효한 날짜
		if(day!=null && isValidDate(day)) {
			today = day;
		}
		//오늘날짜
		else {
			today = compareDay;
		}

		//log.info("normalized today ... : "+today);
		String mEmail = auth.getName();
		List<FoodMyResultDTO> list = foodMyService.getList(today, mEmail);
		//FoodMyDayTotalDTO dayTotalDTO = foodMyService.getDayTotal(day, mEmail);
		Map<String,Object> map = foodMyService.getDayTotalWithRecommend(today, mEmail);	
		
		
		//log.info("list : " + list);
		//log.info("map : " + map);
		
		model.addAttribute("list", list);
		//model.addAttribute("dayTotalDTO", dayTotalDTO);
		model.addAttribute("map", map);
		
		return "member/foodMy";
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping( value = "/modifyFoodMy", consumes="application/json" , produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> modifyFoodMy(@RequestBody Map<String, String> params)throws Exception {
		Long fmNo = Long.parseLong(params.get("fmNo"));
		int fmAmount = Integer.parseInt(params.get("fmAmount"));

		FoodMyDTO foodMyDTO = FoodMyDTO.builder().fmAmount(fmAmount).fmNo(fmNo).build();
		foodMyService.modify(foodMyDTO);

	  return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping( value = "/removeFoodMy", consumes="application/json" , produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> removeFoodMy(@RequestBody Map<String, String> params)throws Exception {
		Long fmNo = Long.parseLong(params.get("fmNo"));

		foodMyService.delete(fmNo);
	  return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	private boolean isValidDate(String day) {
		  SimpleDateFormat dateFormatParser = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);

		  dateFormatParser.setLenient(false);
		  try {
		      dateFormatParser.parse(day);
		      return true;
		  } catch (Exception e) {
		      return false;
		  }
		}

}
