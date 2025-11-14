# typed: strong

module EInvoiceAPI
  module Models
    class Charge < EInvoiceAPI::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(EInvoiceAPI::Charge, EInvoiceAPI::Internal::AnyHash)
        end

      # The charge amount, without VAT. Must be rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :amount

      # The base amount that may be used, in conjunction with the charge percentage, to
      # calculate the charge amount. Must be rounded to maximum 2 decimals
      sig { returns(T.nilable(String)) }
      attr_accessor :base_amount

      # The percentage that may be used, in conjunction with the charge base amount, to
      # calculate the charge amount. To state 20%, use value 20
      sig { returns(T.nilable(String)) }
      attr_accessor :multiplier_factor

      # The reason for the charge
      sig { returns(T.nilable(String)) }
      attr_accessor :reason

      # Charge reason codes for invoice charges and fees
      sig { returns(T.nilable(EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)) }
      attr_accessor :reason_code

      # Duty or tax or fee category codes (Subset of UNCL5305)
      #
      # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
      sig { returns(T.nilable(EInvoiceAPI::Charge::TaxCode::TaggedSymbol)) }
      attr_accessor :tax_code

      # The VAT rate, represented as percentage that applies to the charge
      sig { returns(T.nilable(String)) }
      attr_accessor :tax_rate

      # A charge is an additional fee for example for late payment, late delivery, etc.
      sig do
        params(
          amount: T.nilable(String),
          base_amount: T.nilable(String),
          multiplier_factor: T.nilable(String),
          reason: T.nilable(String),
          reason_code: T.nilable(EInvoiceAPI::Charge::ReasonCode::OrSymbol),
          tax_code: T.nilable(EInvoiceAPI::Charge::TaxCode::OrSymbol),
          tax_rate: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The charge amount, without VAT. Must be rounded to maximum 2 decimals
        amount: nil,
        # The base amount that may be used, in conjunction with the charge percentage, to
        # calculate the charge amount. Must be rounded to maximum 2 decimals
        base_amount: nil,
        # The percentage that may be used, in conjunction with the charge base amount, to
        # calculate the charge amount. To state 20%, use value 20
        multiplier_factor: nil,
        # The reason for the charge
        reason: nil,
        # Charge reason codes for invoice charges and fees
        reason_code: nil,
        # Duty or tax or fee category codes (Subset of UNCL5305)
        #
        # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
        tax_code: nil,
        # The VAT rate, represented as percentage that applies to the charge
        tax_rate: nil
      )
      end

      sig do
        override.returns(
          {
            amount: T.nilable(String),
            base_amount: T.nilable(String),
            multiplier_factor: T.nilable(String),
            reason: T.nilable(String),
            reason_code:
              T.nilable(EInvoiceAPI::Charge::ReasonCode::TaggedSymbol),
            tax_code: T.nilable(EInvoiceAPI::Charge::TaxCode::TaggedSymbol),
            tax_rate: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Charge reason codes for invoice charges and fees
      module ReasonCode
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, EInvoiceAPI::Charge::ReasonCode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AA = T.let(:AA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAA = T.let(:AAA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAC = T.let(:AAC, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAD = T.let(:AAD, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAE = T.let(:AAE, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAF = T.let(:AAF, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAH = T.let(:AAH, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAI = T.let(:AAI, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAS = T.let(:AAS, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAT = T.let(:AAT, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAV = T.let(:AAV, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAY = T.let(:AAY, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AAZ = T.let(:AAZ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABA = T.let(:ABA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABB = T.let(:ABB, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABC = T.let(:ABC, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABD = T.let(:ABD, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABF = T.let(:ABF, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABK = T.let(:ABK, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABL = T.let(:ABL, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABN = T.let(:ABN, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABR = T.let(:ABR, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABS = T.let(:ABS, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABT = T.let(:ABT, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ABU = T.let(:ABU, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ACF = T.let(:ACF, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ACG = T.let(:ACG, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ACH = T.let(:ACH, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ACI = T.let(:ACI, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ACJ = T.let(:ACJ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ACK = T.let(:ACK, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ACL = T.let(:ACL, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ACM = T.let(:ACM, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ACS = T.let(:ACS, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADC = T.let(:ADC, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADE = T.let(:ADE, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADJ = T.let(:ADJ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADK = T.let(:ADK, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADL = T.let(:ADL, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADM = T.let(:ADM, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADN = T.let(:ADN, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADO = T.let(:ADO, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADP = T.let(:ADP, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADQ = T.let(:ADQ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADR = T.let(:ADR, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADT = T.let(:ADT, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADW = T.let(:ADW, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADY = T.let(:ADY, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ADZ = T.let(:ADZ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEA = T.let(:AEA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEB = T.let(:AEB, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEC = T.let(:AEC, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AED = T.let(:AED, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEF = T.let(:AEF, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEH = T.let(:AEH, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEI = T.let(:AEI, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEJ = T.let(:AEJ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEK = T.let(:AEK, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEL = T.let(:AEL, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEM = T.let(:AEM, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEN = T.let(:AEN, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEO = T.let(:AEO, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEP = T.let(:AEP, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AES = T.let(:AES, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AET = T.let(:AET, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEU = T.let(:AEU, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEV = T.let(:AEV, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEW = T.let(:AEW, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEX = T.let(:AEX, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEY = T.let(:AEY, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AEZ = T.let(:AEZ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AJ = T.let(:AJ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        AU = T.let(:AU, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CA = T.let(:CA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAB = T.let(:CAB, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAD = T.let(:CAD, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAE = T.let(:CAE, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAF = T.let(:CAF, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAI = T.let(:CAI, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAJ = T.let(:CAJ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAK = T.let(:CAK, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAL = T.let(:CAL, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAM = T.let(:CAM, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAN = T.let(:CAN, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAO = T.let(:CAO, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAP = T.let(:CAP, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAQ = T.let(:CAQ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAR = T.let(:CAR, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAS = T.let(:CAS, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAT = T.let(:CAT, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAU = T.let(:CAU, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAV = T.let(:CAV, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAW = T.let(:CAW, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAX = T.let(:CAX, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAY = T.let(:CAY, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CAZ = T.let(:CAZ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CD = T.let(:CD, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CG = T.let(:CG, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CS = T.let(:CS, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        CT = T.let(:CT, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAB = T.let(:DAB, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAC = T.let(:DAC, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAD = T.let(:DAD, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAF = T.let(:DAF, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAG = T.let(:DAG, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAH = T.let(:DAH, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAI = T.let(:DAI, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAJ = T.let(:DAJ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAK = T.let(:DAK, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAL = T.let(:DAL, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAM = T.let(:DAM, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAN = T.let(:DAN, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAO = T.let(:DAO, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAP = T.let(:DAP, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DAQ = T.let(:DAQ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        DL = T.let(:DL, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        EG = T.let(:EG, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        EP = T.let(:EP, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ER = T.let(:ER, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        FAA = T.let(:FAA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        FAB = T.let(:FAB, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        FAC = T.let(:FAC, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        FC = T.let(:FC, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        FH = T.let(:FH, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        FI = T.let(:FI, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        GAA = T.let(:GAA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        HAA = T.let(:HAA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        HD = T.let(:HD, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        HH = T.let(:HH, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        IAA = T.let(:IAA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        IAB = T.let(:IAB, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ID = T.let(:ID, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        IF = T.let(:IF, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        IR = T.let(:IR, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        IS = T.let(:IS, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        KO = T.let(:KO, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        L1 = T.let(:L1, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        LA = T.let(:LA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        LAA = T.let(:LAA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        LAB = T.let(:LAB, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        LF = T.let(:LF, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        MAE = T.let(:MAE, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        MI = T.let(:MI, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ML = T.let(:ML, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        NAA = T.let(:NAA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        OA = T.let(:OA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        PA = T.let(:PA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        PAA = T.let(:PAA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        PC = T.let(:PC, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        PL = T.let(:PL, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        PRV = T.let(:PRV, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        RAB = T.let(:RAB, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        RAC = T.let(:RAC, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        RAD = T.let(:RAD, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        RAF = T.let(:RAF, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        RE = T.let(:RE, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        RF = T.let(:RF, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        RH = T.let(:RH, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        RV = T.let(:RV, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        SA = T.let(:SA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        SAA = T.let(:SAA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        SAD = T.let(:SAD, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        SAE = T.let(:SAE, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        SAI = T.let(:SAI, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        SG = T.let(:SG, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        SH = T.let(:SH, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        SM = T.let(:SM, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        SU = T.let(:SU, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        TAB = T.let(:TAB, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        TAC = T.let(:TAC, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        TT = T.let(:TT, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        TV = T.let(:TV, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        V1 = T.let(:V1, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        V2 = T.let(:V2, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        WH = T.let(:WH, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        XAA = T.let(:XAA, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        YY = T.let(:YY, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)
        ZZZ = T.let(:ZZZ, EInvoiceAPI::Charge::ReasonCode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[EInvoiceAPI::Charge::ReasonCode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Duty or tax or fee category codes (Subset of UNCL5305)
      #
      # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
      module TaxCode
        extend EInvoiceAPI::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, EInvoiceAPI::Charge::TaxCode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AE = T.let(:AE, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        E = T.let(:E, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        S = T.let(:S, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        Z = T.let(:Z, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        G = T.let(:G, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        O = T.let(:O, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        K = T.let(:K, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        L = T.let(:L, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        M = T.let(:M, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)
        B = T.let(:B, EInvoiceAPI::Charge::TaxCode::TaggedSymbol)

        sig do
          override.returns(T::Array[EInvoiceAPI::Charge::TaxCode::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
