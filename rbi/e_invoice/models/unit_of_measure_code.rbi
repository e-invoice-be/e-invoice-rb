# typed: strong

module EInvoice
  module Models
    # Unit of Measure Codes from UNECERec20 used in Peppol BIS Billing 3.0.
    module UnitOfMeasureCode
      extend EInvoice::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, EInvoice::UnitOfMeasureCode) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      UNIT_OF_MEASURE_CODE_10 =
        T.let(:"10", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_11 =
        T.let(:"11", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_13 =
        T.let(:"13", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_14 =
        T.let(:"14", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_15 =
        T.let(:"15", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_20 =
        T.let(:"20", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_21 =
        T.let(:"21", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_22 =
        T.let(:"22", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_23 =
        T.let(:"23", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_24 =
        T.let(:"24", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_25 =
        T.let(:"25", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_27 =
        T.let(:"27", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_28 =
        T.let(:"28", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_33 =
        T.let(:"33", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_34 =
        T.let(:"34", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_35 =
        T.let(:"35", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_37 =
        T.let(:"37", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_38 =
        T.let(:"38", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_40 =
        T.let(:"40", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_41 =
        T.let(:"41", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_56 =
        T.let(:"56", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_57 =
        T.let(:"57", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_58 =
        T.let(:"58", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_59 =
        T.let(:"59", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_60 =
        T.let(:"60", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_61 =
        T.let(:"61", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_74 =
        T.let(:"74", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_77 =
        T.let(:"77", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_80 =
        T.let(:"80", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_81 =
        T.let(:"81", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_85 =
        T.let(:"85", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_87 =
        T.let(:"87", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_89 =
        T.let(:"89", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_91 =
        T.let(:"91", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_1_I =
        T.let(:"1I", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      EA = T.let(:EA, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E01 = T.let(:E01, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E07 = T.let(:E07, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E09 = T.let(:E09, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E10 = T.let(:E10, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E12 = T.let(:E12, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E14 = T.let(:E14, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E17 = T.let(:E17, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E20 = T.let(:E20, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E23 = T.let(:E23, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E25 = T.let(:E25, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E27 = T.let(:E27, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E31 = T.let(:E31, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E34 = T.let(:E34, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E35 = T.let(:E35, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E36 = T.let(:E36, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E37 = T.let(:E37, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E38 = T.let(:E38, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E39 = T.let(:E39, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E40 = T.let(:E40, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E41 = T.let(:E41, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E42 = T.let(:E42, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E43 = T.let(:E43, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E44 = T.let(:E44, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E45 = T.let(:E45, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E46 = T.let(:E46, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E47 = T.let(:E47, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E48 = T.let(:E48, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E49 = T.let(:E49, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E50 = T.let(:E50, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E51 = T.let(:E51, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E52 = T.let(:E52, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E53 = T.let(:E53, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E54 = T.let(:E54, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E55 = T.let(:E55, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E56 = T.let(:E56, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E57 = T.let(:E57, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E58 = T.let(:E58, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E60 = T.let(:E60, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E62 = T.let(:E62, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E65 = T.let(:E65, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E66 = T.let(:E66, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E67 = T.let(:E67, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E69 = T.let(:E69, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E70 = T.let(:E70, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E71 = T.let(:E71, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E73 = T.let(:E73, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E75 = T.let(:E75, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      E76 = T.let(:E76, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_2_A =
        T.let(:"2A", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_2_B =
        T.let(:"2B", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      UNIT_OF_MEASURE_CODE_2_C =
        T.let(:"2C", EInvoice::UnitOfMeasureCode::TaggedSymbol)
      ZZ = T.let(:ZZ, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      NAR = T.let(:NAR, EInvoice::UnitOfMeasureCode::TaggedSymbol)
      C62 = T.let(:C62, EInvoice::UnitOfMeasureCode::TaggedSymbol)

      sig do
        override.returns(T::Array[EInvoice::UnitOfMeasureCode::TaggedSymbol])
      end
      def self.values
      end
    end
  end
end
