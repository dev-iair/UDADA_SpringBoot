package ga.udada.udada.food;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class FoodDetailController {
	
	private final FoodDetailService foodDetailService;
	
	@ResponseBody
	@GetMapping("/food/foodname")
	public List<FoodDetailDTO> getNameList(FoodDetailDTO foodDetailDTO) throws Exception{
		
		List<FoodDetailDTO> list = foodDetailService.getNameList(foodDetailDTO);
		
		//log.info(list);
		
		return list;
		
	}

}
