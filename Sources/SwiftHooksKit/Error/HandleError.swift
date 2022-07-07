// Copyright © 2022 Andrew Lord.

func handleFatalError<ResultT>(using printer: Printer, block: () throws -> ResultT) throws -> ResultT {
    do {
        return try block()
    } catch let error as SwiftHooksError {
        printer.printError(error)
        throw ExitCode.failure
    } catch {
        printer.printError(.otherError(error.localizedDescription))
        throw ExitCode.failure
    }
}

func handleNonFatalError(using printer: Printer, block: () throws -> Void) {
    do {
        try block()
    } catch let error as SwiftHooksError {
        printer.printError(error)
    } catch {
        printer.printError(.otherError(error.localizedDescription))
    }
}
