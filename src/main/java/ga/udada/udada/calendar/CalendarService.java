package ga.udada.udada.calendar;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CalendarService {

	List<CalendarDTO> listSevenDays(String mEmail) throws Exception;
	List<CalendarDTO> listMonth(@Param("calendarDate")String calendarDate, @Param("mEmail")String mEmail) throws Exception;
}
