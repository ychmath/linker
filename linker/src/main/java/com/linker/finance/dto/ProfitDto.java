package com.linker.finance.dto;

import java.time.LocalDate;
import java.util.Date;

import lombok.Data;

@Data
public class ProfitDto{
    private int ticketorderid;
    private String tickettypename;
    private int quantity;
    private int price;
    private Date orderdate;
	/*
	 * public String getOrderId() { return this.orderId; }
	 * 
	 * public String getTicketType() { return this.ticketType; }
	 * 
	 * public int getQuantity() { return this.quantity; }
	 * 
	 * public double getTotalPrice() { return this.totalPrice; }
	 * 
	 * public LocalDate getOrderDate() { return this.orderDate; }
	 * 
	 * public void setOrderId(final String orderId) { this.orderId = orderId; }
	 * 
	 * public void setTicketType(final String ticketType) { this.ticketType =
	 * ticketType; }
	 * 
	 * public void setQuantity(final int quantity) { this.quantity = quantity; }
	 * 
	 * public void setTotalPrice(final double totalPrice) { this.totalPrice =
	 * totalPrice; }
	 * 
	 * public void setOrderDate(final LocalDate orderDate) { this.orderDate =
	 * orderDate; }
	 * 
	 * @Override public boolean equals(final Object o) { if (o == this) { return
	 * true; } if (!(o instanceof ProfitDto)) { return false; } final ProfitDto
	 * other = (ProfitDto)o; if (!other.canEqual(this)) { return false; } if
	 * (this.getQuantity() != other.getQuantity()) { return false; } if
	 * (Double.compare(this.getTotalPrice(), other.getTotalPrice()) != 0) { return
	 * false; } final Object this$orderId = this.getOrderId(); final Object
	 * other$orderId = other.getOrderId(); Label_0094: { if (this$orderId == null) {
	 * if (other$orderId == null) { break Label_0094; } } else if
	 * (this$orderId.equals(other$orderId)) { break Label_0094; } return false; }
	 * final Object this$ticketType = this.getTicketType(); final Object
	 * other$ticketType = other.getTicketType(); Label_0131: { if (this$ticketType
	 * == null) { if (other$ticketType == null) { break Label_0131; } } else if
	 * (this$ticketType.equals(other$ticketType)) { break Label_0131; } return
	 * false; } final Object this$orderDate = this.getOrderDate(); final Object
	 * other$orderDate = other.getOrderDate(); if (this$orderDate == null) { if
	 * (other$orderDate == null) { return true; } } else if
	 * (this$orderDate.equals(other$orderDate)) { return true; } return false; }
	 * 
	 * protected boolean canEqual(final Object other) { return other instanceof
	 * ProfitDto; }
	 * 
	 * @Override public int hashCode() { int result = 1; result = result * 59 +
	 * this.getQuantity(); final long $totalPrice =
	 * Double.doubleToLongBits(this.getTotalPrice()); result = result * 59 +
	 * (int)($totalPrice ^ $totalPrice >>> 32); final Object $orderId =
	 * this.getOrderId(); result = result * 59 + (($orderId == null) ? 43 :
	 * $orderId.hashCode()); final Object $ticketType = this.getTicketType(); result
	 * = result * 59 + (($ticketType == null) ? 43 : $ticketType.hashCode()); final
	 * Object $orderDate = this.getOrderDate(); result = result * 59 + (($orderDate
	 * == null) ? 43 : $orderDate.hashCode()); return result; }
	 * 
	 * @Override public String toString() { return "TicketOrderDTO(orderId=" +
	 * this.getOrderId() + ", ticketType=" + this.getTicketType() + ", quantity=" +
	 * this.getQuantity() + ", totalPrice=" + this.getTotalPrice() + ", orderDate="
	 * + this.getOrderDate() + ")"; }
	 */
}
