<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DangKi.aspx.cs" Inherits="QLVS.QuanLy.DangKi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-8 load_data">
        <h2>ĐĂNG KÝ</h2>
        <br />
        <div class="row form-inline">
            <div class="form-group">
                Đại lý:
                <asp:DropDownList runat="server" ID="sDaiLy" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsDaiLy" DataTextField="TENDAILY" DataValueField="MADAILY">
                    <asp:ListItem Value="-1">Tất cả</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;
            </div>
            <div class="form-group">
                <button class="btn btn-danger"><i class="fa fa-search"></i></button>
            </div>
        </div>
        <br />
        <br />

        <asp:GridView CssClass="table table-hover" ID="gvLoaiVeSo" runat="server" AutoGenerateColumns="False" DataSourceID="dsDangKi" AllowPaging="True" PageSize="15" DataKeyNames="MADKI">
            <Columns>
                <asp:BoundField DataField="TENDAILY" HeaderText="Đại lý" SortExpression="TENDAILY" ReadOnly="True" />
                <asp:BoundField DataField="NGAYDK" HeaderText="Ngày đăng ký" SortExpression="NGAYDK" DataFormatString="{0:dd/MM/yyyy}" ReadOnly="True" />
                <asp:BoundField DataField="DANGKI" HeaderText="Số lượng" SortExpression="DANGKI" DataFormatString="{0:#,##0}" />
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
                <label class="control-label col-sm-3" for="pwd">Đại lý: </label>
                <div class="col-sm-8">
                    <asp:DropDownList runat="server" ID="MADAILY" CssClass="form-control" DataSourceID="dsDaiLy" DataTextField="TENDAILY" DataValueField="MADAILY">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="pwd">Số lượng: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="DANGKI" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="DANGKI" ErrorMessage="Vui lòng nhập số lượng" Text="*" ValidationGroup="vldInsert" Display="Dynamic" />
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


    <asp:SqlDataSource ID="dsDangKi" runat="server" ConnectionString="<%$ ConnectionStrings:QLVSConnectionString %>" DeleteCommand="DELETE FROM DANGKI WHERE MADKI = @original_MADKI" InsertCommand="INSERT INTO DANGKI(MADAILY, NGAYDK, DANGKI) VALUES (@MADAILY, GETDATE(), @DANGKI)" SelectCommand="SELECT DANGKI.*, DAILY.TENDAILY
FROM DANGKI INNER JOIN DAILY ON DANGKI.MADAILY = DAILY.MADAILY
WHERE @MaDaiLy = '-1' OR DANGKI.MADAILY = @MaDaiLy
ORDER BY NGAYDK DESC" UpdateCommand="UPDATE DANGKI SET DANGKI = @DANGKI WHERE (MADKI = @original_MADKI)" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_MADKI" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter Name="MADAILY" ControlID="MADAILY" PropertyName="SelectedValue" />
            <asp:ControlParameter Name="DANGKI" ControlID="DANGKI" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="sDaiLy" DefaultValue="-1" Name="MaDaiLy" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DANGKI" />
            <asp:Parameter Name="original_MADKI" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDaiLy" runat="server" ConnectionString="<%$ ConnectionStrings:QLVSConnectionString %>" SelectCommand="SELECT MADAILY, TENDAILY FROM DAILY ORDER BY TENDAILY"></asp:SqlDataSource>

</asp:Content>
