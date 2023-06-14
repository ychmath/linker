package com.linker.ticket.dto;

import lombok.Data;

@Data
public class TicketUpdateDto {
	private int tickettypeid;
	private String tickettypename;
	private int price;
}
