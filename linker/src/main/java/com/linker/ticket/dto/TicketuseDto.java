package com.linker.ticket.dto;

import java.util.Date;
import lombok.Data;

@Data
public class TicketuseDto {
	private int tickettypeid;
	private int quantity;
	private Date orderdate;
}
