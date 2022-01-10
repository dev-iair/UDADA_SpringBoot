package ga.udada.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import ga.udada.udada.food.FoodDetailDTO;

@Mapper
public interface FoodDetailMapper {
	
	List<FoodDetailDTO> selectFname(FoodDetailDTO foodDetailDTO);

}
