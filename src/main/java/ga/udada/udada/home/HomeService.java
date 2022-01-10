package ga.udada.udada.home;

import java.util.List;

public interface HomeService {

	List<HotJournalDTO> getHotJournal();

	List<EndSoonChallengeDTO> endSoonChallenge();

	List<HighRateRecipeDTO> highRateRecipe();

	int getMyExcs(String mEmail);

	Double getBmi(String mEmail);

}
