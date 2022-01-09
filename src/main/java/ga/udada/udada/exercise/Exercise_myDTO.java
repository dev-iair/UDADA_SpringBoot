package ga.udada.udada.exercise;

import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Exercise_myDTO {
	private long emNo;	
	private String mEmail;	
	private Date emDate;	
	private long eNo;	
	private int emTime;	
	private String eName;
	private long eKcal;
}
