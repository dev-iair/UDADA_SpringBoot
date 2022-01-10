package ga.udada.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import ga.udada.udada.foodmy.FoodMyDTO;
import ga.udada.udada.foodmy.FoodMyDayTotalDTO;
import ga.udada.udada.foodmy.FoodMyMemberSpecDTO;
import ga.udada.udada.foodmy.FoodMyResultDTO;

@Mapper
public interface FoodMyMapper {

	List<FoodMyResultDTO> select(@Param("day")String day, @Param("mEmail")String mEmail);
	int update(FoodMyDTO foodMyDTO);
	int delete(Long fmNo);	
	FoodMyDayTotalDTO selectDayTotal(@Param("day")String day, @Param("mEmail")String mEmail);
	FoodMyMemberSpecDTO selectMemberInfo(String mEmail);
	
	FoodMyDayTotalDTO selectDayTotalWithDay(@Param("day")String day, @Param("mEmail")String mEmail);
}
