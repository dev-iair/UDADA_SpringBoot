package ga.udada.udada.food;

import java.util.List;

import ga.udada.udada.foodmy.FoodMyDTO;
import ga.udada.udada.mapper.FoodMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FoodServiceImpl implements FoodService{

	private final FoodMapper foodMapper;
	
	@Override
	public int countAll() throws Exception {
		// TODO Auto-generated method stub
		return foodMapper.countAll();
	}

	@Override
	public List<FoodDTO> getList() throws Exception {
		// TODO Auto-generated method stub
		return foodMapper.getList();
	}
	
	@Override
	public List<FoodDTO> getMinList(String fMjclass) throws Exception {
		// TODO Auto-generated method stub
		return foodMapper.getMinList(fMjclass);
	}
	
	@Override
	public FoodDTO getFoodList(String fNo) throws Exception {
		// TODO Auto-generated method stub
		return foodMapper.getFoodList(fNo);
	}
	
	@Override
	public List<FoodDTO> getByFName(String keyword) throws Exception {
		return foodMapper.selectByFName(keyword);
	}

	@Override
	public void registerFoodMy(FoodMyDTO foodMyDTO) throws Exception {
		// TODO Auto-generated method stub
		foodMapper.insertFoodMy(foodMyDTO);
	}
	
}
