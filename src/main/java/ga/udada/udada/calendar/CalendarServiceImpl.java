package ga.udada.udada.calendar;

import java.util.List;

import ga.udada.udada.mapper.CalendarMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarMapper calendarMapper;

	@Override
	public List<CalendarDTO> listSevenDays(String mEmail) throws Exception{
		return calendarMapper.select(mEmail);
	}

	@Override
	public List<CalendarDTO> listMonth(String calendarDate, String mEmail) throws Exception {
		return calendarMapper.selectByMonth(calendarDate, mEmail);
	}
}
