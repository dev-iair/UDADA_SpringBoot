
 package ga.udada.udada.exercise;
  
  import java.util.List;

  
import ga.udada.udada.mapper.ExerciseMapper;

import org.springframework.stereotype.Service;
  
  import lombok.RequiredArgsConstructor; 
  
  @Service
  @RequiredArgsConstructor
  public class ExerciseServiceImpl implements ExerciseService{
  
  private final ExerciseMapper exerciseMapper;
  
  @Override 
  public List<ExerciseDTO> getList() {

  	 return exerciseMapper.getList(); 
  }

  @Override
  public ExerciseDTO get(Long eNo) {		
	 return exerciseMapper.read(eNo); 
  }

  @Override
  public List<Exercise_myDTO> myList(ExercisePageRequestDTO exercisePageRequestDTO) {
	 return exerciseMapper.myList(exercisePageRequestDTO);
  }

  @Override
  public ExerciseDTO myget(Long eNo) {
	  return exerciseMapper.myget(eNo);
  }

  @Override
  public boolean remove(Long eNo) throws Exception {
	  return exerciseMapper.delete(eNo)==1;
  }

  @Override
  public void insert(Exercise_myDTO exercise_myDTO) {
	  exerciseMapper.insert(exercise_myDTO);
	
  }

  @Override
  public int countAllWithSearch(ExercisePageRequestDTO exercisePageRequestDTO) {
	  return exerciseMapper.countAllWithSearch(exercisePageRequestDTO);
  }

  @Override
  public List<ExerciseDTO> getListWithImageAndPagingAndSearch(ExercisePageRequestDTO exercisePageRequestDTO) throws Exception {
	  return exerciseMapper.selectWithImageAndPagingAndSearch(exercisePageRequestDTO);
}

@Override
public int countAllMylist(ExercisePageRequestDTO exercisePageRequestDTO) {
	return exerciseMapper.countAllMylist(exercisePageRequestDTO);
}

@Override
public List<ExerciseGetMyListDTO> getMyExcsList(String mEmail) {
	return exerciseMapper.getMyExcsList(mEmail);
}

  
  
  

}