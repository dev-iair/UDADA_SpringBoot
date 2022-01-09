package ga.udada.udada.food;

import java.util.List;

import ga.udada.udada.mapper.FoodDetailMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FoodDetailServiceImpl implements FoodDetailService{
	
	private final FoodDetailMapper foodDetailMapper;

	@Override
	public List<FoodDetailDTO> getNameList(FoodDetailDTO foodDetailDTO) throws Exception {
		// TODO Auto-generated method stub
	
		return foodDetailMapper.selectFname(foodDetailDTO);
		
	}
	
}
