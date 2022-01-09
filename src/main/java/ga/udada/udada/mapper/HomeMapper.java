package ga.udada.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import ga.udada.udada.EndSoonChallengeDTO;
import ga.udada.udada.HighRateRecipeDTO;
import ga.udada.udada.HotJournalDTO;

public interface HomeMapper {

	List<HotJournalDTO> getHotJournal();

	List<EndSoonChallengeDTO> endSoonChallenge();

	List<HighRateRecipeDTO> highRateRecipe();

	int getMyExcs(@Param("mEmail") String mEmail);

	Double getBmi(@Param("mEmail") String mEmail);

}
