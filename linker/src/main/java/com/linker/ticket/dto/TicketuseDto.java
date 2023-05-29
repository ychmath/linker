package com.linker.ticket.dto;

import java.util.Date;
import lombok.Data;

@Data
public class TicketuseDto {
	private String tickettypename;
	private int quantity;
	private Date usedate;
	private int phone;
}