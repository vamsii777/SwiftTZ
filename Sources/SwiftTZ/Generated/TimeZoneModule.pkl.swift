// Code generated from Pkl module `TimeZoneModule`. DO NOT EDIT.
import PklSwift

public enum TimeZoneModule {}

extension TimeZoneModule {
    /// All supported IANA timezone identifiers
    public enum TimeZoneIdentifier: String, CaseIterable, Decodable, Hashable {
        case pacificPago_Pago = "Pacific/Pago_Pago"
        case pacificNiue = "Pacific/Niue"
        case pacificHonolulu = "Pacific/Honolulu"
        case pacificTahiti = "Pacific/Tahiti"
        case americaAdak = "America/Adak"
        case pacificMarquesas = "Pacific/Marquesas"
        case pacificGambier = "Pacific/Gambier"
        case americaAnchorage = "America/Anchorage"
        case pacificPitcairn = "Pacific/Pitcairn"
        case americaLos_Angeles = "America/Los_Angeles"
        case americaPhoenix = "America/Phoenix"
        case americaDenver = "America/Denver"
        case pacificGalapagos = "Pacific/Galapagos"
        case americaMexico_City = "America/Mexico_City"
        case pacificEaster = "Pacific/Easter"
        case americaChicago = "America/Chicago"
        case americaLima = "America/Lima"
        case americaJamaica = "America/Jamaica"
        case americaHavana = "America/Havana"
        case americaNew_York = "America/New_York"
        case americaCaracas = "America/Caracas"
        case americaSanto_Domingo = "America/Santo_Domingo"
        case americaSantiago = "America/Santiago"
        case americaHalifax = "America/Halifax"
        case americaSt_Johns = "America/St_Johns"
        case americaSao_Paulo = "America/Sao_Paulo"
        case americaMiquelon = "America/Miquelon"
        case americaNoronha = "America/Noronha"
        case americaNuuk = "America/Nuuk"
        case atlanticCape_Verde = "Atlantic/Cape_Verde"
        case atlanticAzores = "Atlantic/Azores"
        case africaAbidjan = "Africa/Abidjan"
        case europeLondon = "Europe/London"
        case europeLisbon = "Europe/Lisbon"
        case antarcticaTroll = "Antarctica/Troll"
        case africaAlgiers = "Africa/Algiers"
        case africaLagos = "Africa/Lagos"
        case europeDublin = "Europe/Dublin"
        case africaCasablanca = "Africa/Casablanca"
        case europeParis = "Europe/Paris"
        case africaMaputo = "Africa/Maputo"
        case africaTripoli = "Africa/Tripoli"
        case africaJohannesburg = "Africa/Johannesburg"
        case europeAthens = "Europe/Athens"
        case africaCairo = "Africa/Cairo"
        case asiaBeirut = "Asia/Beirut"
        case europeChisinau = "Europe/Chisinau"
        case asiaGaza = "Asia/Gaza"
        case asiaJerusalem = "Asia/Jerusalem"
        case europeIstanbul = "Europe/Istanbul"
        case africaNairobi = "Africa/Nairobi"
        case europeMoscow = "Europe/Moscow"
        case asiaTehran = "Asia/Tehran"
        case asiaDubai = "Asia/Dubai"
        case asiaKabul = "Asia/Kabul"
        case asiaTashkent = "Asia/Tashkent"
        case asiaKarachi = "Asia/Karachi"
        case asiaColombo = "Asia/Colombo"
        case asiaKolkata = "Asia/Kolkata"
        case asiaKathmandu = "Asia/Kathmandu"
        case asiaDhaka = "Asia/Dhaka"
        case asiaYangon = "Asia/Yangon"
        case asiaBangkok = "Asia/Bangkok"
        case asiaJakarta = "Asia/Jakarta"
        case asiaSingapore = "Asia/Singapore"
        case australiaPerth = "Australia/Perth"
        case asiaShanghai = "Asia/Shanghai"
        case asiaHong_Kong = "Asia/Hong_Kong"
        case asiaManila = "Asia/Manila"
        case asiaMakassar = "Asia/Makassar"
        case australiaEucla = "Australia/Eucla"
        case asiaChita = "Asia/Chita"
        case asiaTokyo = "Asia/Tokyo"
        case asiaSeoul = "Asia/Seoul"
        case asiaJayapura = "Asia/Jayapura"
        case australiaDarwin = "Australia/Darwin"
        case australiaAdelaide = "Australia/Adelaide"
        case asiaVladivostok = "Asia/Vladivostok"
        case australiaBrisbane = "Australia/Brisbane"
        case pacificGuam = "Pacific/Guam"
        case australiaSydney = "Australia/Sydney"
        case australiaLord_Howe = "Australia/Lord_Howe"
        case pacificBougainville = "Pacific/Bougainville"
        case pacificNorfolk = "Pacific/Norfolk"
        case asiaKamchatka = "Asia/Kamchatka"
        case pacificAuckland = "Pacific/Auckland"
        case pacificChatham = "Pacific/Chatham"
        case pacificTongatapu = "Pacific/Tongatapu"
        case pacificKiritimati = "Pacific/Kiritimati"
    }

    public struct Module: PklRegisteredType, Decodable, Hashable {
        public static let registeredIdentifier: String = "TimeZoneModule"

        /// Default timezone for the current system
        public var defaultTimeZone: TimeZoneIdentifier

        public init(defaultTimeZone: TimeZoneIdentifier) {
            self.defaultTimeZone = defaultTimeZone
        }
    }

    /// Load the Pkl module at the given source and evaluate it into `TimeZoneModule.Module`.
    ///
    /// - Parameter source: The source of the Pkl module.
    public static func loadFrom(source: ModuleSource) async throws -> TimeZoneModule.Module {
        try await PklSwift.withEvaluator { evaluator in
            try await loadFrom(evaluator: evaluator, source: source)
        }
    }

    /// Load the Pkl module at the given source and evaluate it with the given evaluator into
    /// `TimeZoneModule.Module`.
    ///
    /// - Parameter evaluator: The evaluator to use for evaluation.
    /// - Parameter source: The module to evaluate.
    public static func loadFrom(
        evaluator: PklSwift.Evaluator,
        source: PklSwift.ModuleSource
    ) async throws -> TimeZoneModule.Module {
        try await evaluator.evaluateModule(source: source, as: Module.self)
    }
}