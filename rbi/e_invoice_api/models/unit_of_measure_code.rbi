# typed: strong

module EInvoiceAPI
  module Models
    # Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
    module UnitOfMeasureCode
      extend EInvoiceAPI::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, EInvoiceAPI::UnitOfMeasureCode) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      UNIT_OF_MEASURE_CODE_10 =
        T.let(:"10", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_11 =
        T.let(:"11", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_13 =
        T.let(:"13", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_14 =
        T.let(:"14", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_15 =
        T.let(:"15", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_20 =
        T.let(:"20", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_21 =
        T.let(:"21", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_22 =
        T.let(:"22", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_23 =
        T.let(:"23", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_24 =
        T.let(:"24", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_25 =
        T.let(:"25", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_27 =
        T.let(:"27", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_28 =
        T.let(:"28", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_33 =
        T.let(:"33", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_34 =
        T.let(:"34", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_35 =
        T.let(:"35", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_37 =
        T.let(:"37", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_38 =
        T.let(:"38", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_40 =
        T.let(:"40", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_41 =
        T.let(:"41", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_56 =
        T.let(:"56", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_57 =
        T.let(:"57", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_58 =
        T.let(:"58", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_59 =
        T.let(:"59", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_60 =
        T.let(:"60", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_61 =
        T.let(:"61", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_74 =
        T.let(:"74", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_77 =
        T.let(:"77", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_80 =
        T.let(:"80", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_81 =
        T.let(:"81", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_85 =
        T.let(:"85", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_87 =
        T.let(:"87", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_89 =
        T.let(:"89", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_91 =
        T.let(:"91", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_1_I =
        T.let(:"1I", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      EA = T.let(:EA, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E01 = T.let(:E01, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E07 = T.let(:E07, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E09 = T.let(:E09, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E10 = T.let(:E10, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E12 = T.let(:E12, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E14 = T.let(:E14, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E17 = T.let(:E17, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E20 = T.let(:E20, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E23 = T.let(:E23, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E25 = T.let(:E25, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E27 = T.let(:E27, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E31 = T.let(:E31, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E34 = T.let(:E34, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E35 = T.let(:E35, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E36 = T.let(:E36, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E37 = T.let(:E37, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E38 = T.let(:E38, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E39 = T.let(:E39, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E40 = T.let(:E40, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E41 = T.let(:E41, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E42 = T.let(:E42, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E43 = T.let(:E43, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E44 = T.let(:E44, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E45 = T.let(:E45, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E46 = T.let(:E46, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E47 = T.let(:E47, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E48 = T.let(:E48, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E49 = T.let(:E49, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E50 = T.let(:E50, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E51 = T.let(:E51, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E52 = T.let(:E52, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E53 = T.let(:E53, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E54 = T.let(:E54, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E55 = T.let(:E55, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E56 = T.let(:E56, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E57 = T.let(:E57, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E58 = T.let(:E58, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E60 = T.let(:E60, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E62 = T.let(:E62, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E65 = T.let(:E65, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E66 = T.let(:E66, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E67 = T.let(:E67, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E69 = T.let(:E69, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E70 = T.let(:E70, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E71 = T.let(:E71, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E73 = T.let(:E73, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E75 = T.let(:E75, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      E76 = T.let(:E76, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_2_A =
        T.let(:"2A", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_2_B =
        T.let(:"2B", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_2_C =
        T.let(:"2C", EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      ZZ = T.let(:ZZ, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      NAR = T.let(:NAR, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      C62 = T.let(:C62, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)
      LTR = T.let(:LTR, EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol)

      sig do
        override.returns(T::Array[EInvoiceAPI::UnitOfMeasureCode::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
