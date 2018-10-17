<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind ="LoaiVeSo.aspx.cs" Inherits="QLVS.QuanLy.LoaiVeSo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-sm-8 load_data">
        <h2>LOẠI VÉ SỐ</h2>
        <br />
        <div class="row form-inline">
            <div class="form-group">
                Từ khóa:
                <asp:TextBox runat="server" ID="sKeyword" Class="form-control"/>
                &nbsp;&nbsp;
                Thứ:
                <asp:DropDownList runat="server" ID="sThu" AppendDataBoundItems="true" CssClass="form-control">
                    <asp:ListItem Value="-1">Tất cả</asp:ListItem>
                    <asp:ListItem>Thứ Hai</asp:ListItem>
                    <asp:ListItem>Thứ Ba</asp:ListItem>
                    <asp:ListItem>Thứ Tư</asp:ListItem>
                    <asp:ListItem>Thứ Năm</asp:ListItem>
                    <asp:ListItem>Thứ Sáu</asp:ListItem>
                    <asp:ListItem>Thứ Bảy</asp:ListItem>
                    <asp:ListItem>Chủ Nhật</asp:ListItem>
                </asp:DropDownList>
                &nbsp;&nbsp;
            </div>
            <div class="form-group">
                <button class="btn btn-danger"><i class="fa fa-search"></i></button>
            </div>
        </div>
        <br />
        <br />

        <asp:GridView CssClass="table table-hover" ID="gvLoaiVeSo" runat="server" AutoGenerateColumns="False" DataKeyNames="MAVS" DataSourceID="dsLoaiVeSo" AllowPaging="True" PageSize="15">
            <Columns>
                <asp:BoundField DataField="MAVS" HeaderText="Mã vé số" ReadOnly="True" SortExpression="MAVS" />
                <asp:BoundField DataField="TINH" HeaderText="Tỉnh" SortExpression="TINH" />
                <asp:TemplateField HeaderText="Thứ" SortExpression="THU">
                    <EditItemTemplate>
                        <asp:DropDownList runat="server" ID="uThu" AppendDataBoundItems="true" CssClass="form-control" SelectedValue='<%# Bind("THU") %>'>
                            <asp:ListItem>Thứ Hai</asp:ListItem>
                            <asp:ListItem>Thứ Ba</asp:ListItem>
                            <asp:ListItem>Thứ Tư</asp:ListItem>
                            <asp:ListItem>Thứ Năm</asp:ListItem>
                            <asp:ListItem>Thứ Sáu</asp:ListItem>
                            <asp:ListItem>Thứ Bảy</asp:ListItem>
                            <asp:ListItem>Chủ Nhật</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("THU") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="GIA" HeaderText="Giá" SortExpression="GIA" DataFormatString="{0:#,##0}" />
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
                <label class="control-label col-sm-3" for="pwd">Mã vé số: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="MAVS" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="MAVS" ErrorMessage="Vui lòng nhập mã vé số" Text="*" ValidationGroup="vldInsert" Display="Dynamic" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="pwd">Tỉnh: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="TINH" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TINH" ErrorMessage="Vui lòng nhập tỉnh" Text="*" ValidationGroup="vldInsert" Display="Dynamic" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="pwd">Thứ: </label>
                <div class="col-sm-8">
                    <asp:DropDownList runat="server" ID="THU" AppendDataBoundItems="true" CssClass="form-control" SelectedValue='<%# Bind("THU") %>'>
                        <asp:ListItem>Thứ Hai</asp:ListItem>
                        <asp:ListItem>Thứ Ba</asp:ListItem>
                        <asp:ListItem>Thứ Tư</asp:ListItem>
                        <asp:ListItem>Thứ Năm</asp:ListItem>
                        <asp:ListItem>Thứ Sáu</asp:ListItem>
                        <asp:ListItem>Thứ Bảy</asp:ListItem>
                        <asp:ListItem>Chủ Nhật</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="pwd">Giá: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="GIA" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="GIA" ErrorMessage="Vui lòng nhập giá" Text="*" ValidationGroup="vldInsert" Display="Dynamic" />
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


    <asp:SqlDataSource ID="dsLoaiVeSo" runat="server" ConnectionString="<%$ ConnectionStrings:QLVSConnectionString %>" DeleteCommand="DELETE FROM LOAIVESO WHERE MAVS = @original_MAVS" InsertCommand="INSERT INTO LOAIVESO VALUES(@MaVS, @Tinh, @Thu, @Gia)" SelectCommand="SELECT * FROM LOAIVESO
WHERE (MAVS LIKE '%' + @Keyword + '%' OR TINH LIKE '%' + @Keyword + '%') AND (@Thu IS NULL OR @Thu = '-1' OR THU = @Thu)
ORDER BY MAVS" UpdateCommand="UPDATE LOAIVESO SET Tinh = @Tinh, Thu = @Thu, Gia = @Gia WHERE MAVS = @original_MAVS" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_MAVS" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter Name="MaVS" ControlID="MAVS" PropertyName="Text" />
            <asp:ControlParameter Name="Tinh" ControlID="TINH" PropertyName="Text" />
            <asp:ControlParameter Name="Thu" ControlID="THU" PropertyName="SelectedValue" />
            <asp:ControlParameter Name="Gia" ControlID="GIA" PropertyName="Text" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="sKeyword" DefaultValue="%" Name="Keyword" PropertyName="Text" />
            <asp:ControlParameter ControlID="sThu" DefaultValue="" Name="Thu" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Tinh" />
            <asp:Parameter Name="Thu" />
            <asp:Parameter Name="Gia" />
            <asp:Parameter Name="original_MAVS" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
