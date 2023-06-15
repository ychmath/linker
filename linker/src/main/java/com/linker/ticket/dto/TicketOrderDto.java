package com.linker.ticket.dto;

import java.util.Date;
import lombok.*;

@Data
public class TicketOrderDto{
	
	private int ticketorderid;
	private int tickettypeid;
	private Date orderdate;
	private String tickettypename;
	private int price;
	private int quantity;
	private int totalprice;
	private String userid;
	private int tickettype;
	
}
