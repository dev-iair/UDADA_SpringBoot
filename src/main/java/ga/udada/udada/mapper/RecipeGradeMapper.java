package ga.udada.udada.mapper;

import ga.udada.udada.recipe.RecipeGradeDTO;

public interface RecipeGradeMapper {
	
	void insert(RecipeGradeDTO recipeGradeDTO);
	void delete(RecipeGradeDTO recipeGradeDTO);
	Double selectAvgByRNo(Long rNo);

}
