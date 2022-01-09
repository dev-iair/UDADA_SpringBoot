package ga.udada.udada.mapper;

import ga.udada.udada.recipe.RecipeIngredientDTO;

public interface RecipeIngredientMapper {
	
	void insert(RecipeIngredientDTO recipeIngredientDTO);
	int deleteByRNo(Long rNo);

}
