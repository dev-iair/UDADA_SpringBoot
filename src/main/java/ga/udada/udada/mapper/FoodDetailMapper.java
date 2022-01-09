package ga.udada.udada.mapper;

import java.util.List;

import ga.udada.udada.food.FoodDetailDTO;

public interface FoodDetailMapper {
	
	List<FoodDetailDTO> selectFname(FoodDetailDTO foodDetailDTO);

}
