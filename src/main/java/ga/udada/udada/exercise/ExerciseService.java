package ga.udada.udada.exercise;

import java.util.List;


public interface ExerciseService {
	
	List<ExerciseDTO> getList();
	ExerciseDTO get(Long eNo);
	List<Exercise_myDTO> myList(ExercisePageRequestDTO exercisePageRequestDTO);
	ExerciseDTO myget(Long eNo);
	boolean remove(Long eNo) throws Exception;
	void insert(Exercise_myDTO exercise_myDTO);
	
	int countAllWithSearch(ExercisePageRequestDTO exercisePageRequestDTO);
	List<ExerciseDTO> getListWithImageAndPagingAndSearch(ExercisePageRequestDTO exercisePageRequestDTO) throws Exception;
	int countAllMylist(ExercisePageRequestDTO exercisePageRequestDTO);
	List<ExerciseGetMyListDTO> getMyExcsList(String mEmail);

}
