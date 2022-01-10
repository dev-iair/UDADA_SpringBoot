package ga.udada.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import ga.udada.udada.exercise.ExerciseDTO;
import ga.udada.udada.exercise.ExerciseGetMyListDTO;
import ga.udada.udada.exercise.ExercisePageRequestDTO;
import ga.udada.udada.exercise.Exercise_myDTO;


@Mapper
public interface ExerciseMapper {
	
	List<ExerciseDTO> getList();
	ExerciseDTO read(Long eNo);
	List<Exercise_myDTO> myList(ExercisePageRequestDTO exercisePageRequestDTO);
	ExerciseDTO myget(Long eNo);
	int delete(Long eNo);
	void insert(Exercise_myDTO exercise_myDTO);

	List<ExerciseDTO> selectWithImageAndPagingAndSearch(ExercisePageRequestDTO exercisePageRequestDTO);
	int countAllWithSearch(ExercisePageRequestDTO exercisePageRequestDTO);
	int countAllMylist(ExercisePageRequestDTO exercisePageRequestDTO);
	List<ExerciseGetMyListDTO> getMyExcsList(@Param("mEmail") String mEmail);

}
