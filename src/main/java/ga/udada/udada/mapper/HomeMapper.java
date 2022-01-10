package ga.udada.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import ga.udada.udada.home.EndSoonChallengeDTO;
import ga.udada.udada.home.HighRateRecipeDTO;
import ga.udada.udada.home.HotJournalDTO;

@Mapper
public interface HomeMapper {

	List<HotJournalDTO> getHotJournal();

	List<EndSoonChallengeDTO> endSoonChallenge();

	List<HighRateRecipeDTO> highRateRecipe();

	int getMyExcs(@Param("mEmail") String mEmail);

	Double getBmi(@Param("mEmail") String mEmail);

}
