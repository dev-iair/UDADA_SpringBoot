package ga.udada.udada.recipe;

import java.util.List;

import ga.udada.udada.food.FoodDTO;
import ga.udada.udada.food.FoodService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class RecipeIngredientSearchController {
	
	private final FoodService foodService;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/searchForIngredient")
	public ResponseEntity<List<FoodDTO>> getFoodByFName(String keyword)throws Exception{
		
		List<FoodDTO> result = foodService.getByFName(keyword);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
}
