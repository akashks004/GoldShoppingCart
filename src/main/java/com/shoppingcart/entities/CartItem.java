package com.shoppingcart.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Entity class of cart item
 * 
 * @author kenarayan
 *
 */
@Entity
@Table(name = "cartitem")
public class CartItem implements Serializable {

	private static final long serialVersionUID = -2752358242135666542L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cartItemId;

	private int quality;

	private double price;

	@ManyToOne
	@JoinColumn(name = "prodId")
	private Product product;

	@ManyToOne
	@JoinColumn(name = "cartId")
	@JsonIgnore
	private Cart cart;

	public int getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}

	public int getQuality() {
		return quality;
	}

	public void setQuality(int quality) {
		this.quality = quality;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

}
