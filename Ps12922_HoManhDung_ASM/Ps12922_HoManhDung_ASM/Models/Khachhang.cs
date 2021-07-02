using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Ps12922_HoManhDung_ASM.Models
{
    public class Khachhang
    {
        [Key]
        public int KhachhangID { get; set; }
        [StringLength(150)]
        [Required(ErrorMessage = "Bạn cần nhập họ tên.")]
        [Display(Name = "Họ & tên")]
        public string FullName { get; set; }
        [Display(Name = "Ngày sinh")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public  DateTime? Ngaysinh { get; set; }
        [Required(ErrorMessage = "Please enter phone number"), Display(Name = "Số điện thoại")]
        [Column(TypeName = "varchar(15)"), MaxLength(15)]
        [RegularExpression(@"^\(?([0-9]{3})[-. ]?([0-9]{4})[-. ]?([0-9]{3})$", ErrorMessage = "Not a valid Phone number")]
        //039-6313-488
        public string PhoneNumber { get; set; }
        [Required]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Email không chính xác.")]
        public string Email { get; set; }
        [StringLength(200)]
        [Required(ErrorMessage = "Bạn cần địa chỉ.")]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }
        [Required(ErrorMessage = "Please enter password"), Display(Name = "Password")]
        [Column(TypeName = "varchar(50)"), MaxLength(50)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Please enter confirm password"), Display(Name = "Confirm Password")]
        [Column(TypeName = "varchar(50)"), MaxLength(50)]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Password not matched")]
        public string ConfirmPassword { get; set; }
        [StringLength(250)]
        [Display(Name = "Mô tả")]
        public string Mota { get; set; }


    }
}
