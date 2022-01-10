package ga.udada.udada.mapper;

import org.apache.ibatis.annotations.Mapper;

import ga.udada.udada.recipe.RecipeGradeDTO;

@Mapper
public interface RecipeGradeMapper {
	
	void insert(RecipeGradeDTO recipeGradeDTO);
	void delete(RecipeGradeDTO recipeGradeDTO);
	Double selectAvgByRNo(Long rNo);

}
