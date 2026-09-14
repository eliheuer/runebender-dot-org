/* tslint:disable */
/* eslint-disable */

export class BrowserEditor {
    free(): void;
    [Symbol.dispose](): void;
    feedback(): string;
    focus(focused: boolean): void;
    frame(elapsed_ms: number): Uint8Array;
    key(down: boolean, key: string, code: string, mods: number, repeat: boolean): void;
    constructor(width: number, height: number, scale: number);
    pointer(kind: number, x: number, y: number, button: number, buttons: number, count: number, mods: number, dx: number, dy: number): void;
    resize(width: number, height: number, scale: number): void;
    state(): string;
    text(kind: number, text: string): void;
}

export type InitInput = RequestInfo | URL | Response | BufferSource | WebAssembly.Module;

export interface InitOutput {
    readonly memory: WebAssembly.Memory;
    readonly __wbg_browsereditor_free: (a: number, b: number) => void;
    readonly browsereditor_feedback: (a: number) => [number, number];
    readonly browsereditor_focus: (a: number, b: number) => void;
    readonly browsereditor_frame: (a: number, b: number) => [number, number];
    readonly browsereditor_key: (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number) => void;
    readonly browsereditor_new: (a: number, b: number, c: number) => number;
    readonly browsereditor_pointer: (a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number, j: number) => void;
    readonly browsereditor_resize: (a: number, b: number, c: number, d: number) => void;
    readonly browsereditor_state: (a: number) => [number, number];
    readonly browsereditor_text: (a: number, b: number, c: number, d: number) => void;
    readonly __wbindgen_free: (a: number, b: number, c: number) => void;
    readonly __wbindgen_exn_store: (a: number) => void;
    readonly __externref_table_alloc: () => number;
    readonly __wbindgen_externrefs: WebAssembly.Table;
    readonly __wbindgen_malloc: (a: number, b: number) => number;
    readonly __wbindgen_realloc: (a: number, b: number, c: number, d: number) => number;
    readonly __wbindgen_start: () => void;
}

export type SyncInitInput = BufferSource | WebAssembly.Module;

/**
 * Instantiates the given `module`, which can either be bytes or
 * a precompiled `WebAssembly.Module`.
 *
 * @param {{ module: SyncInitInput }} module - Passing `SyncInitInput` directly is deprecated.
 *
 * @returns {InitOutput}
 */
export function initSync(module: { module: SyncInitInput } | SyncInitInput): InitOutput;

/**
 * If `module_or_path` is {RequestInfo} or {URL}, makes a request and
 * for everything else, calls `WebAssembly.instantiate` directly.
 *
 * @param {{ module_or_path: InitInput | Promise<InitInput> }} module_or_path - Passing `InitInput` directly is deprecated.
 *
 * @returns {Promise<InitOutput>}
 */
export default function __wbg_init (module_or_path?: { module_or_path: InitInput | Promise<InitInput> } | InitInput | Promise<InitInput>): Promise<InitOutput>;
