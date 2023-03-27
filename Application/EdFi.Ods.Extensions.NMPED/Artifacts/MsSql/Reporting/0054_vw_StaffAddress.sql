select
codeValue,
count(*)
FROM edfi.StudentEducationOrganizationAssociationAddress
join edfi.Descriptor on DescriptorId = AddressTypeDescriptorId
group by codeValue
