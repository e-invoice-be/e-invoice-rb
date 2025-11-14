# frozen_string_literal: true

module EInvoiceAPI
  module Models
    class Charge < EInvoiceAPI::Internal::Type::BaseModel
      # @!attribute amount
      #   The charge amount, without VAT. Must be rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :amount, String, nil?: true

      # @!attribute base_amount
      #   The base amount that may be used, in conjunction with the charge percentage, to
      #   calculate the charge amount. Must be rounded to maximum 2 decimals
      #
      #   @return [String, nil]
      optional :base_amount, String, nil?: true

      # @!attribute multiplier_factor
      #   The percentage that may be used, in conjunction with the charge base amount, to
      #   calculate the charge amount. To state 20%, use value 20
      #
      #   @return [String, nil]
      optional :multiplier_factor, String, nil?: true

      # @!attribute reason
      #   The reason for the charge
      #
      #   @return [String, nil]
      optional :reason, String, nil?: true

      # @!attribute reason_code
      #   Charge reason codes for invoice charges and fees
      #
      #   @return [Symbol, EInvoiceAPI::Models::Charge::ReasonCode, nil]
      optional :reason_code, enum: -> { EInvoiceAPI::Charge::ReasonCode }, nil?: true

      # @!attribute tax_code
      #   Duty or tax or fee category codes (Subset of UNCL5305)
      #
      #   Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
      #
      #   @return [Symbol, EInvoiceAPI::Models::Charge::TaxCode, nil]
      optional :tax_code, enum: -> { EInvoiceAPI::Charge::TaxCode }, nil?: true

      # @!attribute tax_rate
      #   The VAT rate, represented as percentage that applies to the charge
      #
      #   @return [String, nil]
      optional :tax_rate, String, nil?: true

      # @!method initialize(amount: nil, base_amount: nil, multiplier_factor: nil, reason: nil, reason_code: nil, tax_code: nil, tax_rate: nil)
      #   Some parameter documentations has been truncated, see
      #   {EInvoiceAPI::Models::Charge} for more details.
      #
      #   A charge is an additional fee for example for late payment, late delivery, etc.
      #
      #   @param amount [String, nil] The charge amount, without VAT. Must be rounded to maximum 2 decimals
      #
      #   @param base_amount [String, nil] The base amount that may be used, in conjunction with the charge percentage, to
      #
      #   @param multiplier_factor [String, nil] The percentage that may be used, in conjunction with the charge base amount, to
      #
      #   @param reason [String, nil] The reason for the charge
      #
      #   @param reason_code [Symbol, EInvoiceAPI::Models::Charge::ReasonCode, nil] Charge reason codes for invoice charges and fees
      #
      #   @param tax_code [Symbol, EInvoiceAPI::Models::Charge::TaxCode, nil] Duty or tax or fee category codes (Subset of UNCL5305)
      #
      #   @param tax_rate [String, nil] The VAT rate, represented as percentage that applies to the charge

      # Charge reason codes for invoice charges and fees
      #
      # @see EInvoiceAPI::Models::Charge#reason_code
      module ReasonCode
        extend EInvoiceAPI::Internal::Type::Enum

        AA = :AA
        AAA = :AAA
        AAC = :AAC
        AAD = :AAD
        AAE = :AAE
        AAF = :AAF
        AAH = :AAH
        AAI = :AAI
        AAS = :AAS
        AAT = :AAT
        AAV = :AAV
        AAY = :AAY
        AAZ = :AAZ
        ABA = :ABA
        ABB = :ABB
        ABC = :ABC
        ABD = :ABD
        ABF = :ABF
        ABK = :ABK
        ABL = :ABL
        ABN = :ABN
        ABR = :ABR
        ABS = :ABS
        ABT = :ABT
        ABU = :ABU
        ACF = :ACF
        ACG = :ACG
        ACH = :ACH
        ACI = :ACI
        ACJ = :ACJ
        ACK = :ACK
        ACL = :ACL
        ACM = :ACM
        ACS = :ACS
        ADC = :ADC
        ADE = :ADE
        ADJ = :ADJ
        ADK = :ADK
        ADL = :ADL
        ADM = :ADM
        ADN = :ADN
        ADO = :ADO
        ADP = :ADP
        ADQ = :ADQ
        ADR = :ADR
        ADT = :ADT
        ADW = :ADW
        ADY = :ADY
        ADZ = :ADZ
        AEA = :AEA
        AEB = :AEB
        AEC = :AEC
        AED = :AED
        AEF = :AEF
        AEH = :AEH
        AEI = :AEI
        AEJ = :AEJ
        AEK = :AEK
        AEL = :AEL
        AEM = :AEM
        AEN = :AEN
        AEO = :AEO
        AEP = :AEP
        AES = :AES
        AET = :AET
        AEU = :AEU
        AEV = :AEV
        AEW = :AEW
        AEX = :AEX
        AEY = :AEY
        AEZ = :AEZ
        AJ = :AJ
        AU = :AU
        CA = :CA
        CAB = :CAB
        CAD = :CAD
        CAE = :CAE
        CAF = :CAF
        CAI = :CAI
        CAJ = :CAJ
        CAK = :CAK
        CAL = :CAL
        CAM = :CAM
        CAN = :CAN
        CAO = :CAO
        CAP = :CAP
        CAQ = :CAQ
        CAR = :CAR
        CAS = :CAS
        CAT = :CAT
        CAU = :CAU
        CAV = :CAV
        CAW = :CAW
        CAX = :CAX
        CAY = :CAY
        CAZ = :CAZ
        CD = :CD
        CG = :CG
        CS = :CS
        CT = :CT
        DAB = :DAB
        DAC = :DAC
        DAD = :DAD
        DAF = :DAF
        DAG = :DAG
        DAH = :DAH
        DAI = :DAI
        DAJ = :DAJ
        DAK = :DAK
        DAL = :DAL
        DAM = :DAM
        DAN = :DAN
        DAO = :DAO
        DAP = :DAP
        DAQ = :DAQ
        DL = :DL
        EG = :EG
        EP = :EP
        ER = :ER
        FAA = :FAA
        FAB = :FAB
        FAC = :FAC
        FC = :FC
        FH = :FH
        FI = :FI
        GAA = :GAA
        HAA = :HAA
        HD = :HD
        HH = :HH
        IAA = :IAA
        IAB = :IAB
        ID = :ID
        IF = :IF
        IR = :IR
        IS = :IS
        KO = :KO
        L1 = :L1
        LA = :LA
        LAA = :LAA
        LAB = :LAB
        LF = :LF
        MAE = :MAE
        MI = :MI
        ML = :ML
        NAA = :NAA
        OA = :OA
        PA = :PA
        PAA = :PAA
        PC = :PC
        PL = :PL
        PRV = :PRV
        RAB = :RAB
        RAC = :RAC
        RAD = :RAD
        RAF = :RAF
        RE = :RE
        RF = :RF
        RH = :RH
        RV = :RV
        SA = :SA
        SAA = :SAA
        SAD = :SAD
        SAE = :SAE
        SAI = :SAI
        SG = :SG
        SH = :SH
        SM = :SM
        SU = :SU
        TAB = :TAB
        TAC = :TAC
        TT = :TT
        TV = :TV
        V1 = :V1
        V2 = :V2
        WH = :WH
        XAA = :XAA
        YY = :YY
        ZZZ = :ZZZ

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Duty or tax or fee category codes (Subset of UNCL5305)
      #
      # Agency: UN/CEFACT Version: D.16B Subset: OpenPEPPOL
      #
      # @see EInvoiceAPI::Models::Charge#tax_code
      module TaxCode
        extend EInvoiceAPI::Internal::Type::Enum

        AE = :AE
        E = :E
        S = :S
        Z = :Z
        G = :G
        O = :O
        K = :K
        L = :L
        M = :M
        B = :B

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
