package ga.udada.udada.recipe;

import ga.udada.udada.mapper.RecipeGradeMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RecipeGradeServiceImpl implements RecipeGradeService{
	
	private final RecipeGradeMapper recipeGradeMapper;
	
	@Override
	public void register(RecipeGradeDTO recipeGradeDTO) throws Exception {
		recipeGradeMapper.delete(recipeGradeDTO);
		recipeGradeMapper.insert(recipeGradeDTO);
		
	}

	@Override
	public Double loadAvgByRNo(Long rNo) throws Exception {
		return recipeGradeMapper.selectAvgByRNo(rNo);
	}
	
	

}
