<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QTTour.aspx.cs" Inherits="Exam_HoTen.QTTour" %>


<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">

    <h2>Trang quản trị tour</h2>
    <hr />
    <div class="row">
        <div class="col-md-6">
            <div class="form-inline">
                Tên tour
                    <asp:TextBox ID="txtTen" runat="server" CssClass="form-control" Width="300"></asp:TextBox>
                <asp:Button ID="btTraCuu" OnClick="btTraCuu_Click" runat="server" Text="Tra cứu" CssClass="btn btn-primary" />
            </div>
        </div>
        <div class="col-md-6 text-right">
            <a href="ThemTour.aspx" class="btn btn-success">Thêm tour mới</a>
        </div>
    </div>

    <div style="margin-top: 20px">
        <asp:ListView ID="LsvTour" runat="server" DataKeyNames="MaTour" DataSourceID="dsTour">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="TenTourLabel" runat="server" Text='<%# Eval("TenTour") %>' />
                    </td>
                    <td>
                        <img src="/Hinh_Tour/<%# Eval("Hinh") %>" class="rounded shadow-sm border border-white border-3" style="width: 160px; height: 90px; object-fit: cover;" />

                    </td>
                    <td>
                        <asp:Label ID="SongayLabel" runat="server" Text='<%# Eval("Songay") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DongiaLabel" runat="server" Text='<%# Eval("Dongia") %>' />
                    </td>

                    <td>
                        <asp:Button ID="EditButton" runat="server" CssClass="btn-success shadow btn-sm  px-3" CommandName="Edit" Text="Sửa" />
                       <asp:Button ID="DeleteButton" runat="server" CssClass="btn-danger shadow btn-sm  px-3 " OnClientClick="return confirm('Bạn có chắc muốn xóa không?');" CommandName="Delete" 
                            Text="Xoá" />
                    </td>

                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="TenTourLabel" runat="server" Text='<%# Eval("TenTour") %>' />
                    </td>
                    <td>
                        <img src="/Hinh_Tour/<%# Eval("Hinh") %>" class="rounded shadow-sm border border-white border-3" style="width: 160px; height: 90px; object-fit: cover;" />

                    </td>
                    <td>
                        <asp:TextBox
                            ID="txtSoNgay"
                            runat="server"
                            CssClass="form-control w-50"
                            Text='<%# Bind("Songay") %>' />
                    </td>

                    <td>
                        <asp:TextBox
                            ID="txtDonGia"
                            runat="server"
                            CssClass="form-control w-50"
                            Text='<%# Bind("Dongia") %>' />
                    </td>


                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CssClass="btn-success shadow btn-sm px-3" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CssClass="btn-danger shadow btn-sm  px-3 " CommandName="Cancel" Text="Cancel" />
                    </td>

                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>Không có tour thỏa điều kiện</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="TenTourLabel" runat="server" Text='<%# Eval("TenTour") %>' />
                    </td>
                    <td>
                        <img src="/Hinh_Tour/<%# Eval("Hinh") %>" class="rounded shadow-sm border border-white border-3" style="width: 160px; height: 90px; object-fit: cover;" />

                    </td>
                    <td>
                        <asp:Label ID="SongayLabel" runat="server" Text='<%# Eval("Songay") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DongiaLabel" runat="server" Text='<%# Eval("Dongia") %>' />
                    </td>

                    <td>
                        <asp:Button ID="EditButton" runat="server" CssClass="btn-success shadow btn-sm  px-3 " CommandName="Edit" Text="Sửa" />
                        <asp:Button ID="DeleteButton" runat="server" CssClass="btn-danger shadow btn-sm  px-3 " OnClientClick="return confirm('Bạn có chắc muốn xóa không?');" CommandName="Delete" 
                            Text="Xoá" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" class="table-container shadow-sm w-100">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" class="table w-100 mr-2 m-auto p-1 table-modern text-center">
                                <tr runat="server" class="bg-primary text-white ">

                                    <th runat="server">Tên Tour</th>
                                    <th runat="server">Hình</th>
                                    <th runat="server">Số Ngày</th>
                                    <th runat="server">Đồng Giá</th>
                                    <th class="w-auto" runat="server">Thao Tác</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td class="d-flex justify-content-center mt-5" runat="server" style="">
                            <asp:DataPager ID="TouPager" PageSize="5" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
         
        </asp:ListView>
    </div>

    <asp:SqlDataSource ID="dsTour" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringName %>"
        DeleteCommand="DELETE FROM [Tour] WHERE [MaTour] = @MaTour"
        SelectCommand="SELECT * FROM Tour 
WHERE (@TenTour = '' OR TenTour LIKE '%' + @TenTour + '%')"
        UpdateCommand="UPDATE [Tour] SET  [Songay] = @Songay, [Dongia] = @Dongia WHERE [MaTour] = @MaTour">
        <DeleteParameters>
            <asp:Parameter Name="MaTour" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter DefaultValue=" " ControlID="txtTen" Name="TenTour" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            
            <asp:Parameter Name="Songay" Type="Int16" />
            <asp:Parameter Name="Dongia" Type="Int32" />
            <asp:Parameter Name="MaTour" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


</asp:Content>
