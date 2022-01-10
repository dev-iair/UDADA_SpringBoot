package ga.udada.udada.mapper;

import org.apache.ibatis.annotations.Mapper;

import ga.udada.udada.recipe.RecipeIngredientDTO;

@Mapper
public interface RecipeIngredientMapper {
	
	void insert(RecipeIngredientDTO recipeIngredientDTO);
	int deleteByRNo(Long rNo);

}
