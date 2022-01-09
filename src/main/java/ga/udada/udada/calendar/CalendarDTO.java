package ga.udada.udada.calendar;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CalendarDTO {
	
	private String calendarDate; //2021-06-25 (yyyy-MM-dd)형식
	private int totalKcal;
	private int totalProtein;
	private int totalFat;
	private int totalCarbo;

}
