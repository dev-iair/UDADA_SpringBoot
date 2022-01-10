package ga.udada.udada.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import ga.udada.udada.calendar.CalendarDTO;

@Mapper
public interface CalendarMapper {
	
	List<CalendarDTO> select(String mEmail);
	List<CalendarDTO> selectByMonth(@Param("calendarDate")String calendarDate, @Param("mEmail")String mEmail);

}
