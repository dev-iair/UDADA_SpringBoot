package ga.udada.udada;

import java.util.List;

import ga.udada.udada.mapper.HomeMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor

public class HomeServiceImpl implements HomeService{

	@Autowired
	private HomeMapper homeMapper;

	@Override
	public List<HotJournalDTO> getHotJournal() {
		return homeMapper.getHotJournal();
	}

	@Override
	public List<EndSoonChallengeDTO> endSoonChallenge() {
		return homeMapper.endSoonChallenge();
	}

	@Override
	public List<HighRateRecipeDTO> highRateRecipe() {
		return homeMapper.highRateRecipe();
	}

	@Override
	public int getMyExcs(String mEmail) {
		return homeMapper.getMyExcs(mEmail);
	}

	@Override
	public Double getBmi(String mEmail) {
		return homeMapper.getBmi(mEmail);
	}


}
