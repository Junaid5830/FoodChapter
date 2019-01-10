<%@ Page  Title="Update Order" Language="C#" MasterPageFile="~/MasterPages/Vendor.Master" AutoEventWireup="true" CodeBehind="updateorder.aspx.cs" Inherits="FoodChapter.WebPages.updateorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


       </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="x_panel">
			<div class="x_title">
			<h3>Update order</h3> 
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<br>
				<form novalidate="" id="demo-form2" data-parsley-validate="" method="post" action="#" class="form-horizontal form-label-left">

					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Id <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" type="text" name="id" readonly="readonly" value="824"><br><br>
							<h6 class="error"></h6>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">Total <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input name="price" class="form-control col-md-7 col-xs-12" type="number" value="8"><br><br>
							<h6 class="error"></h6>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">Creation date <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" name="creationdate" type="date" value="0000-00-00 00:00:00"><br><br>
							<h6 class="error"></h6>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">Status</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select name="status">
							<option value="1" id="1" selected="selected">Yes</option>
							<option value="0" id="0">No</option>
							</select>
							<br><br>
							<h6 class="error"></h6>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">Foodie<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" name="employee" readonly="readonly" type="text" value="Muazam"><br><br>
							<h6 class="error"></h6>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">Payment </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select name="payment">
														<option value="7">Cash</option>
														<option value="13">COD</option>
														<option value="14">hihu</option>
														<option value="15">KK</option>
														<option value="16">хаан банк</option>
														<option value="17">mm,m</option>
														<option value="18">paypal</option>
														<option value="19">Testing</option>
														<option value="20">test</option>
														<option value="21">cus</option>
														<option value="22">bank</option>
														<option value="23">pagseguro</option>
														<option value="25">online</option>
														<option value="26">jefmar</option>
														<option value="27">PayU</option>
														<option value="28">CCAvenue</option>
														<option value="29">dxdx</option>
														<option value="30">aa</option>
														<option value="31">Test</option>
														<option value="32">Wire</option>
														<option value="33">Ahmad Alkalouti</option>
														<option value="34">JNE</option>
														<option value="35">BCA 2490233213</option>
														<option value="36">WBLLL</option>
														<option value="38">Ditfrek Postel ICMP</option>
														<option value="39">pp</option>
														<option value="40">shop1</option>
														<option value="41">Pene</option>
														<option value="42">PagSeguro</option>
														<option value="43">Bitcoin</option>
														<option value="44">v</option>
														<option value="45">hjk</option>
														<option value="46">Paypal</option>
														<option value="47">Bitcoinnn</option>
														<option value="51">BRI</option>
														<option value="52">eventbook</option>
														<option value="53">vgdfg</option>
														<option value="54">Paypal</option>
														<option value="55">Net Banking</option>
														<option value="56">Net Banking</option>
														<option value="57">TanTumPAY</option>
														</select>
							<br><br>
							<h6 class="error"></h6>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12">Seller <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input name="customer" class="date-picker form-control col-md-7 col-xs-12" type="text" readonly="readonly" value="Seller">
							<br><br>
							<h6 class="error"></h6>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
							<input type="submit" class="btn vbutton  pull-right" value="Save">
						</div>
					</div>

				</form>
			</div>
		</div>


    </asp:Content>