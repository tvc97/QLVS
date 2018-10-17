<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PhieuChi.aspx.cs" Inherits="QLVS.QuanLy.PhieuChi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-8 load_data">
        <h2>PHIẾU CHI</h2>
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

        <asp:GridView CssClass="table table-hover" ID="gvLoaiVeSo" runat="server" AutoGenerateColumns="False" DataKeyNames="STT" DataSourceID="dsPhieuChi" AllowPaging="True" PageSize="15">
            <Columns>
                <asp:TemplateField HeaderText="Ngày" SortExpression="NGAY">
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
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NGAY", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("NGAY", "{0:dd/MM/yyyy}") %>'></asp:Label>
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
                <asp:BoundField DataField="NOIDUNG" HeaderText="Nội dung" SortExpression="NOIDUNG" />
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
                <label class="control-label col-sm-3" for="pwd">Số tiền: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="SOTIEN" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="SOTIEN" ErrorMessage="Vui lòng nhập số tiền" Text="*" ValidationGroup="vldInsert" Display="Dynamic" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="pwd">Nội dung: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="NOIDUNG" runat="server" CssClass="form-control"></asp:TextBox>
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


    <asp:SqlDataSource ID="dsPhieuChi" runat="server" ConnectionString="<%$ ConnectionStrings:QLVSConnectionString %>" DeleteCommand="DELETE FROM PHIEUCHI WHERE STT = @original_STT" InsertCommand="INSERT INTO PHIEUCHI(NGAY, SOTIEN, NOIDUNG) VALUES (@NGAY, @SOTIEN, @NOIDUNG)" SelectCommand="SELECT * FROM PHIEUCHI
WHERE NOIDUNG LIKE '%' + @Keyword + '%'
ORDER BY NGAY DESC"
        UpdateCommand="UPDATE PHIEUCHI SET NGAY = @NGAY, SOTIEN = @SOTIEN, NOIDUNG = @NOIDUNG WHERE (STT = @original_STT)" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_STT" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter Name="NGAY" ControlID="NGAY" PropertyName="Text" />
            <asp:ControlParameter Name="SOTIEN" ControlID="SOTIEN" PropertyName="Text" />
            <asp:ControlParameter Name="NOIDUNG" ControlID="NOIDUNG" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="sKeyword" DefaultValue="%" Name="Keyword" PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="NGAY" />
            <asp:Parameter Name="SOTIEN" />
            <asp:Parameter Name="NOIDUNG" />
            <asp:Parameter Name="original_STT" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
