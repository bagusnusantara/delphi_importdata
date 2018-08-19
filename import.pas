unit import;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection,comobj;

type
  TForm1 = class(TForm)
    ZConnection1: TZConnection;
    q1: TZQuery;
    openFile: TButton;
    Label1: TLabel;
    od1: TOpenDialog;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    edt_import: TEdit;
    procedure openFileClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.openFileClick(Sender: TObject);
begin
     if od1.Execute then
     edt_import.Text:=od1.FileName;
end;

procedure TForm1.Button1Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select vendor from ven_loc where vendor=:vendor');
              parambyname('vendor').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into ven_loc ');
                        sql.add('(vendor,st_country_kode,ven_loc_name,ven_loc_addr1,phone,city,id_company,st_payment_kode,st_delivery_transport_kode,st_delivery_kode,st_currency_kode)');
                        sql.add('values(:vendor,:st_country_kode,:ven_loc_name,:ven_loc_addr1,:phone,:city,:id_company,:st_payment_kode,:st_delivery_transport_kode,:st_delivery_kode,:st_currency_kode)');
                        parambyname('vendor').value:=Trim(sheet.cells[i,1]);
                        parambyname('st_country_kode').value:=Trim(sheet.cells[i,2]);
                        parambyname('ven_loc_name').value:=Trim(sheet.cells[i,3]);
                        parambyname('ven_loc_addr1').value:=Trim(sheet.cells[i,4]);
                        parambyname('phone').value:=Trim(sheet.cells[i,5]);
                        parambyname('city').value:=Trim(sheet.cells[i,6]);
                        parambyname('id_company').value:=Trim(sheet.cells[i,7]);
                        parambyname('st_payment_kode').value:=Trim(sheet.cells[i,8]);
                        parambyname('st_delivery_transport_kode').value:=Trim(sheet.cells[i,9]);
                        parambyname('st_delivery_kode').value:=Trim(sheet.cells[i,10]);
                        parambyname('st_currency_kode').value:=Trim(sheet.cells[i,11]);
                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select customer from customer where customer=:customer');
              parambyname('customer').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into customer ');
                        sql.add('(customer,customer_name,customer_addr1,customer_phone,customer_country,id_company,st_payment_kode,st_delivery_transport_kode,st_delivery_kode,st_currency_kode_default)');
                        sql.add('values(:customer,:customer_name,:customer_addr1,:customer_phone,:customer_country,:id_company,:st_payment_kode,:st_delivery_transport_kode,:st_delivery_kode,:st_currency_kode_default)');
                        parambyname('customer').value:=Trim(sheet.cells[i,1]);
                        parambyname('customer_name').value:=Trim(sheet.cells[i,2]);
                        parambyname('customer_addr1').value:=Trim(sheet.cells[i,3]);
                        parambyname('customer_phone').value:=Trim(sheet.cells[i,4]);
                        parambyname('customer_country').value:=Trim(sheet.cells[i,5]);
                        parambyname('id_company').value:=Trim(sheet.cells[i,6]);
                        parambyname('st_payment_kode').value:=Trim(sheet.cells[i,7]);
                        parambyname('st_delivery_transport_kode').value:=Trim(sheet.cells[i,8]);
                        parambyname('st_delivery_kode').value:=Trim(sheet.cells[i,9]);
                        parambyname('st_currency_kode_default').value:=Trim(sheet.cells[i,10]);
                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;
    end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 close;
end;

procedure TForm1.Button3Click(Sender: TObject);
var ExcelApp: OleVariant;
    Sheet: Variant;
    i:integer;

begin
  if MessageBox (Handle, 'Anda yakin untuk mengimport data  ?', 'Confirmation',
    MB_OKCANCEL or MB_ICONINFORMATION) = mrOK then
    begin

    ExcelApp := CreateOLEObject('Excel.Application');
    ExcelApp.Workbooks.Open[trim(edt_import.Text)];

    Sheet := ExcelApp.Workbooks[1].Worksheets[1];


    i:=4;

    repeat
    i:=i+1;
    if Trim(sheet.cells[i,1])<>'' then
       begin
          with q1 do
            begin
              sql.clear;
              sql.add('select kode from item_planning where kode=:kode');
              parambyname('kode').value:=Trim(sheet.cells[i,1]);
              open;
              if recordcount=0 then
                 begin


                    with q1 do
                      begin
                        sql.clear;
                        sql.add('insert into item_planning');
                        sql.add('(kode,st_um_kode,deskripsi,min_stock,maks_stock,item_planning_jns_kode,min_order_qty,maks_order_qty,multiple_order_qty,kapasitas_perhari,batch_size,lite_time,id_jenis,id_company,ajl_fjl,id_nonaktif)');
                        sql.add('values(:kode,:st_um_kode,:deskripsi,:min_stock,:maks_stock,:item_planning_jns_kode,:min_order_qty,:maks_order_qty,:multiple_order_qty,:kapasitas_perhari,:batch_size,:lite_time,:id_jenis,:id_company,:ajl_fjl,:id_nonaktif)');
                        parambyname('kode').value:=Trim(sheet.cells[i,1]);
                        parambyname('st_um_kode').value:=Trim(sheet.cells[i,2]);
                        parambyname('deskripsi').value:=Trim(sheet.cells[i,3]);
                        parambyname('min_stock').value:=Trim(sheet.cells[i,4]);
                        parambyname('maks_stock').value:=Trim(sheet.cells[i,5]);
                        parambyname('item_planning_jns_kode').value:=Trim(sheet.cells[i,6]);
                        parambyname('min_order_qty').value:=Trim(sheet.cells[i,7]);
                        parambyname('maks_order_qty').value:=Trim(sheet.cells[i,8]);
                        parambyname('multiple_order_qty').value:=Trim(sheet.cells[i,9]);
                        parambyname('kapasitas_perhari').value:=Trim(sheet.cells[i,10]);
                        parambyname('batch_size').value:=Trim(sheet.cells[i,11]);
                        parambyname('lite_time').value:=Trim(sheet.cells[i,12]);
                        parambyname('id_jenis').value:=Trim(sheet.cells[i,13]);
                        parambyname('id_company').value:=Trim(sheet.cells[i,14]);
                        parambyname('ajl_fjl').value:=Trim(sheet.cells[i,15]);
                        parambyname('id_nonaktif').value:=Trim(sheet.cells[i,16]);
                        try
                          execSQL;

                        except
                          showmessage('Error Insert');
                        end;
                      end;
                 end;
            end;
       end;


    until (Trim(sheet.cells[i+1,1])='') AND (Trim(sheet.cells[i+2,1])='');
    showmessage('Import Data Berhasil');
    end;
    end;


end.
