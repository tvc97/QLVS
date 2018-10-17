<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DotPhatHanh.aspx.cs" Inherits="QLVS.QuanLy.DotPhatHanh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-8 load_data">
        <h2>ĐỢT PHÁT HÀNH</h2>
        <br />
        <div class="row form-inline">
            <div class="form-group">
                Đại lý:
                <asp:DropDownList runat="server" ID="sDaiLy" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsDaiLy" DataTextField="TENDAILY" DataValueField="MADAILY">
                    <asp:ListItem Value="-1">Tất cả</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;
                Loại vé số:
                <asp:DropDownList runat="server" ID="sVS" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsVS" DataTextField="Name" DataValueField="MAVS">
                    <asp:ListItem Value="-1">Tất cả</asp:ListItem>
                </asp:DropDownList>
             </div>
            <div class="form-group">
                <button class="btn btn-danger"><i class="fa fa-search"></i></button>
            </div>
        </div>
        <br />
        <br />
        <asp:Button runat="server" ID="btnPhatHanh" CssClass="btn btn-primary" Text="PHÁT HÀNH VÉ HÔM NAY" OnClick="btnPhatHanh_Click"/>
        <br />
        <br />

        <asp:GridView CssClass="table table-hover" ID="gvLoaiVeSo" runat="server" AutoGenerateColumns="False" DataSourceID="dsDPH" AllowPaging="True" PageSize="15" DataKeyNames="STT">
            <Columns>
                <asp:BoundField DataField="TENDAILY" HeaderText="Đại lý" SortExpression="TENDAILY" ReadOnly="True" />
                <asp:BoundField DataField="TINH" HeaderText="Loại vé" SortExpression="TINH" ReadOnly="True" />
                <asp:BoundField DataField="SOLUONG" HeaderText="Số lượng" SortExpression="SOLUONG" ReadOnly="True" />
                <asp:BoundField DataField="NGAY" HeaderText="Ngày" SortExpression="NGAY" ReadOnly="True" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:TemplateField HeaderText="Số lượng bán" SortExpression="SOLUONGBAN">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SOLUONGBAN") %>' TextMode="Number"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SOLUONGBAN") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hoa hồng (%)" SortExpression="HOAHONG">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("HOAHONG") %>' TextMode="Number"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("HOAHONG") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DOANHTHU" HeaderText="Doanh thu" SortExpression="DOANHTHU" DataFormatString="{0:#,##0}" ReadOnly="True" />
                <asp:TemplateField ShowHeader="false">
                    <EditItemTemplate>
                        <asp:LinkButton runat="server" CausesValidation="False" CommandName="Update" CssClass="btn btn-default">
                            <i class='fa fa-check'></i>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-default">
                            <i class='fa fa-ban'></i>
                        </asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-default">
                            <i class='fa fa-edit'></i>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-default" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?')">
                            <i class='fa fa-trash'></i>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="8em" />
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="Pager" />
        </asp:GridView>
    </div>


    <asp:SqlDataSource ID="dsDPH" runat="server" ConnectionString="<%$ ConnectionStrings:QLVSConnectionString %>" DeleteCommand="DELETE FROM DOTPHATHANH WHERE STT = @original_STT" InsertCommand="EXEC dbo.PHATHANH" SelectCommand="SELECT
	DOTPHATHANH.STT, TENDAILY, TINH, SOLUONG, DOTPHATHANH.NGAY, SOLUONGBAN, HOAHONG, DOANHTHU
FROM DOTPHATHANH
	INNER JOIN LOAIVESO ON DOTPHATHANH.MAVS = LOAIVESO.MAVS
	INNER JOIN DAILY ON DOTPHATHANH.MADAILY = DAILY.MADAILY
WHERE
	(@MaDaiLy = '-1' OR DOTPHATHANH.MADAILY = @MaDaiLy) AND
	(@MaVS = '-1' OR DOTPHATHANH.MAVS = @MaVS)
ORDER BY NGAY DESC"
        UpdateCommand="UPDATE DOTPHATHANH SET SOLUONGBAN = @SOLUONGBAN, HOAHONG = @HOAHONG WHERE (STT = @original_STT)" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_STT" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="sDaiLy" Name="MaDaiLy" PropertyName="SelectedValue" DefaultValue="-1" />
            <asp:ControlParameter ControlID="sDaiLy" Name="MaVS" PropertyName="SelectedValue" DefaultValue="-1" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SOLUONGBAN" />
            <asp:Parameter Name="HOAHONG" />
            <asp:Parameter Name="original_STT" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsVS" runat="server" ConnectionString="<%$ ConnectionStrings:QLVSConnectionString %>" SelectCommand="SELECT MAVS, CONCAT(MAVS, ' (', TINH, ')') Name FROM LOAIVESO" />
    <asp:SqlDataSource ID="dsDaiLy" runat="server" ConnectionString="<%$ ConnectionStrings:QLVSConnectionString %>" SelectCommand="SELECT MADAILY, TENDAILY FROM DAILY ORDER BY TENDAILY"></asp:SqlDataSource>
</asp:Content>
