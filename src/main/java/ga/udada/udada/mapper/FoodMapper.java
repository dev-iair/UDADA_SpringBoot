package ga.udada.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import ga.udada.udada.food.FoodDTO;
import ga.udada.udada.foodmy.FoodMyDTO;

@Mapper
public interface FoodMapper {

	int countAll();
	
	List<FoodDTO> getList();
	List<FoodDTO> getMinList(String fMjclass);
	FoodDTO getFoodList(String fNo);
	
	void insertFoodMy(FoodMyDTO foodMyDTO);
	
	List<FoodDTO> selectByFName(String keyword);
	
}
