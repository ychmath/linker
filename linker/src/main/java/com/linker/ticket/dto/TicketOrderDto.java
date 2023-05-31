package com.linker.ticket.dto;

import java.util.Date;
import lombok.*;

@Data
public class TicketOrderDto{
	
	private int ticketorderid;
	private Date orderdate;
	private int tickettypeid;
	private int price;
	private int quantity;
	private int totalprice;
	private String userid;
	
}
