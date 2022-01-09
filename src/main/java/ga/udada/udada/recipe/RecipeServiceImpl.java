package ga.udada.udada.recipe;

import java.util.List;

import ga.udada.udada.foodmy.FoodMyDTO;
import ga.udada.udada.image.ImageDTO;
import ga.udada.udada.mapper.ImageMapper;
import ga.udada.udada.mapper.RecipeIngredientMapper;
import ga.udada.udada.mapper.RecipeMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RecipeServiceImpl implements RecipeService{
	
	private final RecipeMapper recipeMapper;
	private final RecipeIngredientMapper recipeIngredientMapper;
	private final ImageMapper imageMapper;

	@Override
	public List<RecipeDTO> getList() throws Exception{	
		return recipeMapper.getList();
	}

	@Override
	public RecipeDTO get(Long rNo) throws Exception{		
		return recipeMapper.read(rNo);
	}

	@Override
	public boolean modify(RecipeDTO recipeDTO) throws Exception{		
		return recipeMapper.update(recipeDTO)==1;
	}

	@Override
	public boolean remove(Long rNo) throws Exception{		
		return recipeMapper.delete(rNo)==1;
	}

	@Override
	public void register(RecipeDTO recipeDTO) throws Exception{
		recipeMapper.register(recipeDTO);
		
	}

	@Override @Transactional
	public void registerWithIngredient(RecipeDTO recipeDTO) throws Exception {
		recipeMapper.insertSelectKey(recipeDTO);
		
		if(recipeDTO.getIngredientList()!=null && recipeDTO.getIngredientList().size()>0) {
			
			List<RecipeIngredientDTO> ingredientList = recipeDTO.getIngredientList();
			for(RecipeIngredientDTO dto : ingredientList) {
				dto.setRNo(recipeDTO.getRNo());
				recipeIngredientMapper.insert(dto);
			}
		}		
	}

	@Override 
	public RecipeDTO getWithIngredient(Long rNo) throws Exception {
		return recipeMapper.selectWithIngredient(rNo);		
	}

	@Override @Transactional
	public boolean removeWithIngredient(Long rNo) throws Exception {
		recipeIngredientMapper.deleteByRNo(rNo);
		return recipeMapper.delete(rNo)==1;
	}

	@Override @Transactional
	public boolean modifyWithIngredient(RecipeDTO recipeDTO) throws Exception {
		
		Long rNo = recipeDTO.getRNo();
		recipeIngredientMapper.deleteByRNo(rNo);
		
		int result = recipeMapper.update(recipeDTO);
		if(recipeDTO.getIngredientList()!=null && recipeDTO.getIngredientList().size()>0) {
			
			List<RecipeIngredientDTO> ingredientList = recipeDTO.getIngredientList();
			for(RecipeIngredientDTO dto : ingredientList) {
				dto.setRNo(rNo);
				recipeIngredientMapper.insert(dto);
			}
		}	
		return result==1;
	}

	@Override
	public RecipeDTO getWithIngredientAndFood(Long rNo) throws Exception {
		return recipeMapper.selectWithIngredientAndFood(rNo);	
	}

	@Override
	public List<RecipeDTO> getListWithPaging(PageRequestDTO pageRequestDTO) throws Exception {
		return recipeMapper.selectWithPaging(pageRequestDTO);
	}

	@Override
	public int countAll() {
		return recipeMapper.countAll();
	}

	@Override @Transactional
	public void registerWithIngreAndImage(RecipeDTO recipeDTO) throws Exception {
		recipeMapper.insertSelectKey(recipeDTO);
		Long rNo = recipeDTO.getRNo();
		
		if(recipeDTO.getImageDTO()!=null && recipeDTO.getImageDTO().getIName()!="") {
			ImageDTO imageDTO = recipeDTO.getImageDTO();
			imageDTO.setOriNo(rNo);
			imageMapper.insert(imageDTO);
		}
		
		if(recipeDTO.getIngredientList()!=null && recipeDTO.getIngredientList().size()>0) {
			
			List<RecipeIngredientDTO> ingredientList = recipeDTO.getIngredientList();
			for(RecipeIngredientDTO dto : ingredientList) {
				dto.setRNo(rNo);
				recipeIngredientMapper.insert(dto);
			}
		}	
	}
	
	
	@Override
	public List<RecipeDTO> getListWithImageAndPaging(PageRequestDTO pageRequestDTO) throws Exception {
		return recipeMapper.selectWithImageAndPaging(pageRequestDTO);
	}

	@Override
	public RecipeDTO getWithIngreAndFoodAndImage(Long rNo) throws Exception {
		return recipeMapper.selectWithIngreAndFoodAndImage(rNo);
	}

	@Override @Transactional
	public boolean modifyWithIngreAndImage(RecipeDTO recipeDTO) throws Exception {
		Long rNo = recipeDTO.getRNo();
		recipeIngredientMapper.deleteByRNo(rNo);
		imageMapper.delete(rNo, "RCP");
		
		int result = recipeMapper.update(recipeDTO);
		
		if(recipeDTO.getImageDTO()!=null && recipeDTO.getImageDTO().getIName()!="") {
			ImageDTO imageDTO = recipeDTO.getImageDTO();
			imageDTO.setOriNo(rNo);
			imageMapper.insert(imageDTO);
		}
		if(recipeDTO.getIngredientList()!=null && recipeDTO.getIngredientList().size()>0) {
			
			List<RecipeIngredientDTO> ingredientList = recipeDTO.getIngredientList();
			for(RecipeIngredientDTO dto : ingredientList) {
				dto.setRNo(rNo);
				recipeIngredientMapper.insert(dto);
			}
		}	
		return result==1;
	}

	@Override @Transactional
	public boolean removeWithIngreAndImage(Long rNo) throws Exception {
		imageMapper.delete(rNo, "RCP");
		recipeIngredientMapper.deleteByRNo(rNo);
		return recipeMapper.delete(rNo)==1;
	}

	@Override
	public int countAllWithSearch(PageRequestDTO pageRequestDTO) throws Exception{
		return recipeMapper.countAllWithSearch(pageRequestDTO);
	}

	@Override
	public List<RecipeDTO> getListWithImageAndPagingAndSearch(PageRequestDTO pageRequestDTO) throws Exception {
		return recipeMapper.selectWithImageAndPagingAndSearchAndReply(pageRequestDTO);
	}

	@Override
	public RecipeSpecDTO getRecipeSpec(Long rNo) throws Exception{
		return recipeMapper.selectRecipeSpecByRNo(rNo);
	}

	@Override
	public void registerFoodMy(FoodMyDTO foodMyDTO) throws Exception{
		recipeMapper.insertFoodMy(foodMyDTO);
		
	}

	@Override
	public List<RecipeDTO> getByKewordMEmail(PageRequestDTO pageRequestDTO) throws Exception {
		return recipeMapper.selectByMEmailAndReplyCnt(pageRequestDTO);
	}

	@Override
	public int countAllWithMEmail(PageRequestDTO pageRequestDTO) throws Exception {
		return recipeMapper.countAllWithMEmail(pageRequestDTO);
	}

	@Override
	public RecipeDTO getWithIngreAndFoodAndImageAndReply(Long rNo) throws Exception {
		return recipeMapper.selectWithIngreAndFoodAndImageAndReplyRcp(rNo);
	}


	
	

}
