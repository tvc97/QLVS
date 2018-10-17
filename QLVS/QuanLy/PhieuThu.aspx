<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PhieuThu.aspx.cs" Inherits="QLVS.QuanLy.PhieuThu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-8 load_data">
        <h2>PHIẾU THU</h2>
        <br />
        <div class="row form-inline">
            <div class="form-group">
                Đại lý:
                <asp:DropDownList runat="server" ID="sDaiLy" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="dsDaiLy" DataTextField="TENDAILY" DataValueField="MADAILY">
                    <asp:ListItem Value="-1">Tất cả</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <button class="btn btn-danger"><i class="fa fa-search"></i></button>
            </div>
        </div>
        <br />
        <br />

        <asp:GridView CssClass="table table-hover" ID="gvLoaiVeSo" runat="server" AutoGenerateColumns="False" DataKeyNames="STT" DataSourceID="dsPhieuThu" AllowPaging="True" PageSize="15">
            <Columns>
                <asp:TemplateField HeaderText="Ngày" SortExpression="NGAY">
                    <EditItemTemplate>
                        <asp:LinkButton runat="server" CausesValidation="False" CommandName="Update" CssClass="btn btn-default">
                            <i class='fa fa-check'></i>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-default">
                            <i class='fa fa-ban'></i>
                        </asp:LinkButton>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NGAY", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                    
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-default">
                            <i class='fa fa-edit'></i>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-default" OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?')">
                            <i class='fa fa-trash'></i>
                        </asp:LinkButton>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("NGAY", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="8em" />
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NGAY", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("NGAY", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Đại lý" SortExpression="TENDAILY">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("TENDAILY") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("TENDAILY") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Số tiền" SortExpression="SOTIEN">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SOTIEN", "{0:0}") %>' TextMode="Number"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SOTIEN", "{0:#,##0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
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

                    <ItemStyle HorizontalAlign="Center" Width="8em"></ItemStyle>
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
                <label class="control-label col-sm-3" for="pwd">Ngày: </label>
                <div class="col-sm-8">
                    <asp:TextBox runat="server" ID="NGAY" CssClass="form-control" TextMode="Date" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="NGAY" ErrorMessage="Vui lòng nhập ngày" Text="*" ValidationGroup="vldInsert" Display="Dynamic" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="pwd">Đại lý: </label>
                <div class="col-sm-8">
                    <asp:DropDownList runat="server" ID="MADAILY" CssClass="form-control" DataSourceID="dsDaiLy" DataTextField="TENDAILY" DataValueField="MADAILY">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="pwd">Số tiền: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="SOTIEN" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="SOTIEN" ErrorMessage="Vui lòng nhập số tiền" Text="*" ValidationGroup="vldInsert" Display="Dynamic" />
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


    <asp:SqlDataSource ID="dsPhieuThu" runat="server" ConnectionString="<%$ ConnectionStrings:QLVSConnectionString %>" DeleteCommand="DELETE FROM PHIEUTHU WHERE STT = @original_STT" InsertCommand="INSERT INTO PHIEUTHU(MADAILY, NGAY, SOTIEN) VALUES (@MADAILY, @NGAY, @SOTIEN)" SelectCommand="SELECT PHIEUTHU.*, DAILY.TENDAILY
FROM PHIEUTHU INNER JOIN DAILY ON DAILY.MADAILY = PHIEUTHU.MADAILY
WHERE @MaDaiLy = '-1' OR PHIEUTHU.MADAILY = @MaDaiLy
ORDER BY NGAY DESC"
        UpdateCommand="UPDATE PHIEUTHU SET  NGAY = @NGAY, SOTIEN = @SOTIEN WHERE (STT = @original_STT)" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_STT" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter Name="MADAILY" ControlID="MADAILY" PropertyName="SelectedValue" />
            <asp:ControlParameter Name="NGAY" ControlID="NGAY" PropertyName="Text" />
            <asp:ControlParameter Name="SOTIEN" ControlID="SOTIEN" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="sDaiLy" DefaultValue="-1" Name="MaDaiLy" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="NGAY" />
            <asp:Parameter Name="SOTIEN" />
            <asp:Parameter Name="original_STT" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="dsDaiLy" runat="server" ConnectionString="<%$ ConnectionStrings:QLVSConnectionString %>" SelectCommand="SELECT MADAILY, TENDAILY FROM DAILY ORDER BY TENDAILY"></asp:SqlDataSource>

</asp:Content>
