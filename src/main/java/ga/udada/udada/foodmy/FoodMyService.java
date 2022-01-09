package ga.udada.udada.foodmy;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface FoodMyService {
	
	List<FoodMyResultDTO> getList(String day, String mEmail) throws Exception;
	void modify(FoodMyDTO foodMyDTO) throws Exception;
	void delete(Long fmNo) throws Exception;	
	FoodMyDayTotalDTO getDayTotal(@Param("day")String day, @Param("mEmail")String mEmail) throws Exception;
	Map<String, Object> getDayTotalWithRecommend(@Param("day")String day, @Param("mEmail")String mEmail) throws Exception;
}
