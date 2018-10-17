<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DaiLy.aspx.cs" Inherits="QLVS.QuanLy.DaiLy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-8 load_data">
        <h2>ĐẠI LÝ</h2>
        <br />
        <div class="row form-inline">
            <div class="form-group">
                Từ khóa:
                <asp:TextBox runat="server" ID="sKeyword" Class="form-control" />
            </div>
            <div class="form-group">
                <button class="btn btn-danger"><i class="fa fa-search"></i></button>
            </div>
        </div>
        <br />
        <br />

        <asp:GridView CssClass="table table-hover" ID="gvLoaiVeSo" runat="server" AutoGenerateColumns="False" DataKeyNames="MADAILY" DataSourceID="dsDaiLy" AllowPaging="True" PageSize="15">
            <Columns>
                <asp:BoundField DataField="MADAILY" HeaderText="Mã đại lý" ReadOnly="True" SortExpression="MADAILY" />
                <asp:BoundField DataField="TENDAILY" HeaderText="Tên đại lý" SortExpression="TENDAILY" />
                <asp:BoundField DataField="DIACHI" HeaderText="Địa chỉ" SortExpression="DIACHI" />
                <asp:BoundField DataField="SDT" HeaderText="Số điện thoại" SortExpression="SDT" />
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

        <br />

        <div class="col-sm-9 form-horizontal">
            <div style="text-align: left; color: red">
                <asp:ValidationSummary runat="server" ValidationGroup="vldInsert" DisplayMode="BulletList" />
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="pwd">Mã đại lý: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="MADAILY" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="MADAILY" ErrorMessage="Vui lòng nhập mã đại lý" Text="*" ValidationGroup="vldInsert" Display="Dynamic" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="pwd">Tên đại lý: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="TENDAILY" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TENDAILY" ErrorMessage="Vui lòng nhập tên đại lý" Text="*" ValidationGroup="vldInsert" Display="Dynamic" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="pwd">Địa chỉ: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="DIACHI" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="DIACHI" ErrorMessage="Vui lòng nhập địa chỉ" Text="*" ValidationGroup="vldInsert" Display="Dynamic" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="pwd">Số điện thoại: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="SDT" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="SDT" ErrorMessage="Vui lòng nhập số điện thoại" Text="*" ValidationGroup="vldInsert" Display="Dynamic" />
                </div>
            </div>
            <div class="form-group">
                <asp:LinkButton runat="server" CssClass="btn btn-primary" OnClick="Unnamed1_Click" ValidationGroup="vldInsert">
                    <i class='fa fa-plus'></i>
                    <span>THÊM</span>
                </asp:LinkButton>
            </div>
        </div>
    </div>


    <asp:SqlDataSource ID="dsDaiLy" runat="server" ConnectionString="<%$ ConnectionStrings:QLVSConnectionString %>" DeleteCommand="DELETE FROM DAILY WHERE MADAILY = @original_MADAILY" InsertCommand="INSERT INTO DAILY(MADAILY, TENDAILY, DIACHI, SDT) VALUES (@MADAILY, @TENDAILY, @DIACHI, @SDT)" SelectCommand="SELECT * FROM DAILY
WHERE (
	MADAILY LIKE '%' + @Keyword + '%' OR
	TENDAILY LIKE '%' + @Keyword + '%' OR
	DIACHI LIKE '%' + @Keyword + '%' OR
	SDT LIKE '%' + @Keyword + '%'
)
ORDER BY TENDAILY
"
        UpdateCommand="UPDATE DAILY SET TENDAILY = @TENDAILY, DIACHI = @DIACHI, SDT = @SDT WHERE MADAILY = @original_MADAILY" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_MADAILY" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter Name="MADAILY" ControlID="MADAILY" PropertyName="Text" />
            <asp:ControlParameter Name="TENDAILY" ControlID="TENDAILY" PropertyName="Text" />
            <asp:ControlParameter Name="DIACHI" ControlID="DIACHI" PropertyName="Text" />
            <asp:ControlParameter Name="SDT" ControlID="SDT" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="sKeyword" DefaultValue="%" Name="Keyword" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="TENDAILY" />
            <asp:Parameter Name="DIACHI" />
            <asp:Parameter Name="SDT" />
            <asp:Parameter Name="original_MADAILY" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
