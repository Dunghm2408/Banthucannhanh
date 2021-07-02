using Microsoft.EntityFrameworkCore.Migrations;

namespace Ps12922_HoManhDung_ASM.Migrations
{
    public partial class Init1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Address",
                table: "Khachhangs",
                maxLength: 200,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Khachhangs",
                nullable: false,
                defaultValue: "");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Address",
                table: "Khachhangs");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "Khachhangs");
        }
    }
}
