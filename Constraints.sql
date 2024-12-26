alter table patients add constraint chk_Gender CHECK ( Gender in ('Male','Female'));
alter table rooms add constraint chk_Capacity CHECK ( Capacity>0 );
alter table bills add constraint chk_TotalAmount CHECK(TotalAmount>=0);
alter table medicines add constraint chk_Price CHECK ( Price>0 );
alter table prescriptiondetails add constraint chk_Quantity check ( Quantity>0 );
